import SwiftUI
import CoreUI
import FeatureHome

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(
                viewModel: HomeViewModel(
                    getHomeItemsUseCase: GetHomeItemsUseCase(
                        repository: HomeRepository()
                    )
                )
            )
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(0)

            SettingsTab()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(1)
        }
    }
}

// MARK: - Settings Tab

struct SettingsTab: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Modules") {
                    Label("CoreNetwork", systemImage: "network")
                    Label("CoreUI", systemImage: "paintbrush")
                    Label("Feature-Home", systemImage: "house")
                }
                Section("About") {
                    Label("Version 1.0.0", systemImage: "info.circle")
                }
            }
            .navigationTitle("Settings")
        }
    }
}
