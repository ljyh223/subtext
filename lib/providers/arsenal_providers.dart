import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subtext/data/models/arsenal.dart';
import 'package:subtext/data/repositories/arsenal_repository.dart';
import 'package:subtext/data/sources/arsenal_api.dart';

// Arsenal API Provider
final arsenalApiProvider = Provider<ArsenalApi>((ref) {
  return ArsenalApi();
});

// Arsenal Repository Provider
final arsenalRepositoryProvider = Provider<ArsenalRepository>((ref) {
  final arsenalApi = ref.watch(arsenalApiProvider);
  return ArsenalRepository(arsenalApi: arsenalApi);
});

// Arsenal State
class ArsenalState {
  final List<Arsenal> arsenalList;
  final Arsenal? selectedArsenal;
  final bool isLoading;
  final String? error;

  const ArsenalState({
    this.arsenalList = const [],
    this.selectedArsenal,
    this.isLoading = false,
    this.error,
  });

  ArsenalState copyWith({
    List<Arsenal>? arsenalList,
    Arsenal? selectedArsenal,
    bool? isLoading,
    String? error,
  }) {
    return ArsenalState(
      arsenalList: arsenalList ?? this.arsenalList,
      selectedArsenal: selectedArsenal ?? this.selectedArsenal,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

// Arsenal Notifier
final arsenalNotifierProvider = NotifierProvider<ArsenalNotifier, ArsenalState>(
  ArsenalNotifier.new,
);

class ArsenalNotifier extends Notifier<ArsenalState> {
  late final ArsenalRepository _arsenalRepository;

  @override
  ArsenalState build() {
    _arsenalRepository = ref.read(arsenalRepositoryProvider);
    return const ArsenalState();
  }

  /// 获取所有锦囊条目
  Future<void> fetchAllArsenal() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final arsenalList = await _arsenalRepository.getAllArsenal();
      state = state.copyWith(arsenalList: arsenalList, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  /// 根据category获取锦囊条目
  Future<void> fetchArsenalByCategory(String category) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final arsenalList = await _arsenalRepository.getArsenalByCategory(category);
      state = state.copyWith(arsenalList: arsenalList, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  /// 根据id获取单个锦囊条目
  Future<void> fetchArsenalById(int id) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final arsenal = await _arsenalRepository.getArsenalById(id);
      state = state.copyWith(selectedArsenal: arsenal, isLoading: false);
      // 增加使用次数
      await _arsenalRepository.incrementUsageCount(id);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  /// 清除选中的锦囊条目
  void clearSelectedArsenal() {
    state = state.copyWith(selectedArsenal: null);
  }
}
