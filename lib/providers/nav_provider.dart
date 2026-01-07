import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppTab { home, arsenal, scan, agents, me }

enum HomeView { overview, graph }

enum AnalysisState { empty, analyzing, result, cotLog, simulator }

class AppState {
  final AppTab currentTab;
  final HomeView homeView;
  final AnalysisState analysisState;
  final bool showSidePanel;
  final bool showSim;

  AppState({
    this.currentTab = AppTab.home,
    this.homeView = HomeView.overview,
    this.analysisState = AnalysisState.empty,
    this.showSidePanel = false,
    this.showSim = false,
  });

  AppState copyWith({
    AppTab? currentTab,
    HomeView? homeView,
    AnalysisState? analysisState,
    bool? showSidePanel,
    bool? showSim,
  }) {
    return AppState(
      currentTab: currentTab ?? this.currentTab,
      homeView: homeView ?? this.homeView,
      analysisState: analysisState ?? this.analysisState,
      showSidePanel: showSidePanel ?? this.showSidePanel,
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

  void setHomeView(HomeView view) {
    state = state.copyWith(homeView: view);
  }

  void setAnalysisState(AnalysisState state) {
    this.state = this.state.copyWith(analysisState: state);
  }

  void toggleSidePanel() {
    state = state.copyWith(showSidePanel: !state.showSidePanel);
  }

  void toggleShowSim() {
    state = state.copyWith(showSim: !state.showSim);
  }

  void startAnalysis() {
    state = state.copyWith(analysisState: AnalysisState.analyzing);
    // Simulate 2 second delay
    Future.delayed(const Duration(seconds: 2), () {
      state = state.copyWith(analysisState: AnalysisState.result);
    });
  }
}
