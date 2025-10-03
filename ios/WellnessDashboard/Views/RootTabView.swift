import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            NavigationStack {
                DashboardView()
                    .toolbar(.hidden, for: .navigationBar)
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }

            NavigationStack {
                StatsPlaceholderView()
                    .navigationTitle("Stats")
            }
            .tabItem {
                Image(systemName: "chart.bar.fill")
                Text("Stats")
            }

            NavigationStack {
                ProfilePlaceholderView()
                    .navigationTitle("Profile")
            }
            .tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
        }
        .tint(AppTheme.Colors.accent)
    }
}

struct StatsPlaceholderView: View {
    var body: some View {
        Text("Coming soon")
            .font(.callout)
            .foregroundColor(AppTheme.Colors.secondaryText)
    }
}

struct ProfilePlaceholderView: View {
    var body: some View {
        Text("Coming soon")
            .font(.callout)
            .foregroundColor(AppTheme.Colors.secondaryText)
    }
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
            .preferredColorScheme(.light)
    }
}
