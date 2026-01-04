import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:subtext/data/models/arsenal.dart';
import 'package:subtext/data/repositories/arsenal_repository.dart';
import 'package:subtext/data/sources/arsenal_api.dart';

part 'arsenal_providers.freezed.dart';

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
@freezed
class ArsenalState with _$ArsenalState {
  const factory ArsenalState({
    @Default([]) List<Arsenal> arsenalList,
    Arsenal? selectedArsenal,
    @Default(false) bool isLoading,
    String? error,
  }) = _ArsenalState;
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
      final arsenalList = await _arsenalRepository.getArsenalByCategory(
        category,
      );
      state = state.copyWith(arsenalList: arsenalList, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  /// 清除选中的锦囊条目
  void clearSelectedArsenal() {
    state = state.copyWith(selectedArsenal: null);
  }

  /// 根据id获取单个锦囊条目
  Future<void> fetchArsenalById(int id) async {
    state = state.copyWith(isLoading: true, error: null, selectedArsenal: null);
    try {
      final arsenal = await _arsenalRepository.getArsenalById(id);
      state = state.copyWith(selectedArsenal: arsenal, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
        selectedArsenal: null,
      );
    }
  }
}
