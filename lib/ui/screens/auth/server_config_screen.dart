import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subtext/core/config/server_config.dart';
import 'package:subtext/core/config/server_config_storage.dart';

class ServerConfigScreen extends ConsumerStatefulWidget {
  const ServerConfigScreen({super.key, this.onConfigSaved});

  final VoidCallback? onConfigSaved;

  @override
  ConsumerState<ServerConfigScreen> createState() => _ServerConfigScreenState();
}

class _ServerConfigScreenState extends ConsumerState<ServerConfigScreen> {
  String _protocol = 'https';
  final _hostController = TextEditingController();
  final _portController = TextEditingController(text: '443');
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  List<String> _hostHistory = [];
  bool _showHistory = false;

  @override
  void initState() {
    super.initState();
    _loadConfig();
    _loadHostHistory();
  }

  Future<void> _loadConfig() async {
    final storage = ServerConfigStorage();
    final config = await storage.loadConfig();
    if (config != null) {
      // 解析baseUrl为协议、主机和端口
      final uri = Uri.parse(config.baseUrl);
      setState(() {
        _protocol = uri.scheme;
        _hostController.text = uri.host;
        _portController.text = uri.port.toString();
      });
    }
  }

  Future<void> _loadHostHistory() async {
    final storage = ServerConfigStorage();
    final history = await storage.getHostHistory();
    setState(() {
      _hostHistory = history;
    });
  }

  Future<void> _saveConfig() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // 构建完整的baseUrl
      final host = _hostController.text.trim();
      final port = _portController.text.trim();
      final baseUrl = '$_protocol://$host:$port';

      final config = ServerConfig(baseUrl: baseUrl);

      final storage = ServerConfigStorage();
      await storage.saveConfig(config);
      await storage.saveHostToHistory(host);

      if (mounted) {
        if (widget.onConfigSaved != null) {
          widget.onConfigSaved!();
        }

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('配置保存成功')));

        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('配置保存失败: $e')));
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _selectFromHistory(String host) {
    setState(() {
      _hostController.text = host;
      _showHistory = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('服务端配置')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 标题
              const Text(
                '服务器配置',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              
              // 表单容器
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 协议选择
                    const Text(
                      '协议',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: _protocol,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                _protocol = newValue!;
                                // 根据协议自动设置默认端口
                                _portController.text = newValue == 'https' ? '443' : '80';
                              });
                            },
                            items: <String>['http', 'https']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    
                    // 主机地址输入
                    const Text(
                      '主机地址',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Column(
                      children: [
                        TextFormField(
                          controller: _hostController,
                          decoration: const InputDecoration(
                            hintText: 'api.example.com',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return '请输入主机地址';
                            }
                            return null;
                          },
                          onTap: () {
                            setState(() {
                              _showHistory = !_showHistory;
                            });
                          },
                        ),
                        
                        // 主机历史记录下拉列表
                        if (_showHistory && _hostHistory.isNotEmpty) ...[
                          const SizedBox(height: 4.0),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Column(
                              children: _hostHistory.map((host) {
                                return ListTile(
                                  title: Text(host),
                                  onTap: () => _selectFromHistory(host),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.clear, size: 18),
                                    onPressed: () async {
                                      final storage = ServerConfigStorage();
                                      await storage.saveHostToHistory('');
                                      await _loadHostHistory();
                                    },
                                  ),
                                  dense: true,
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    
                    // 端口输入
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '端口',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              TextFormField(
                                controller: _portController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return '请输入端口';
                                  }
                                  final port = int.tryParse(value.trim());
                                  if (port == null || port < 1 || port > 65535) {
                                    return '请输入有效的端口号(1-65535)';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          flex: 2,
                          child: Container(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              
              // 操作按钮
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 48.0,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _saveConfig,
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text('保存配置'),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  SizedBox(
                    width: double.infinity,
                    height: 48.0,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('取消'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _hostController.dispose();
    _portController.dispose();
    super.dispose();
  }
}