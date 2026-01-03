import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppTab { home, scan, agents }

class AppState {
  final AppTab currentTab;
  final bool isAnalyzing;
  final bool hasResult;
  final bool showSim;

  AppState({
    this.currentTab = AppTab.home,
    this.isAnalyzing = false,
    this.hasResult = false,
    this.showSim = false,
  });

  AppState copyWith({
    AppTab? currentTab,
    bool? isAnalyzing,
    bool? hasResult,
    bool? showSim,
  }) {
    return AppState(
      currentTab: currentTab ?? this.currentTab,
      isAnalyzing: isAnalyzing ?? this.isAnalyzing,
      hasResult: hasResult ?? this.hasResult,
      showSim: showSim ?? this.showSim,
    );
  }
}

final appStateProvider = NotifierProvider<AppStateNotifier, AppState>(() {
  return AppStateNotifier();
});

class AppStateNotifier extends Notifier<AppState> {
  @override
  AppState build() {
    return AppState();
  }

  void setCurrentTab(AppTab tab) {
    state = state.copyWith(currentTab: tab);
  }

  void startAnalysis() {
    state = state.copyWith(isAnalyzing: true);
    // Simulate 2 second delay
    Future.delayed(const Duration(seconds: 2), () {
      state = state.copyWith(isAnalyzing: false, hasResult: true);
    });
  }

  void toggleShowSim() {
    state = state.copyWith(showSim: !state.showSim);
  }

  void resetAnalysis() {
    state = state.copyWith(hasResult: false, showSim: false);
  }
}
