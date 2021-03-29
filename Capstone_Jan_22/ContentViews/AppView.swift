//
//  AppView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 3/18/21.
//

import SwiftUI

struct AppView: View {
    @State private var currentTab = 3
  var body: some View {
    TabView(selection: $currentTab) {
        ResourcesView()
          .tabItem({
            Image("tabicon-avocado")
            Text("Resources")
          })
            .tag(1)
        InsightsView()
          .tabItem({
            Image("tabicon-book")
            Text("Insights")
          })
            .tag(2)
        WelcomeView()
          .tabItem({
            Image("tabicon-settings")
            Text("Home")
          })
            .tag(3)

        GoalsView()
          .tabItem({
            Image("tabicon-avocado")
            Text("Goals")
          })
            .tag(4)
        SettingsView()
          .tabItem({
            Image("tabicon-settings")
            Text("Settings")
          })
            .tag(5)
//      HomeView()
//        .tabItem({
//          Image("tabicon-branch")
//          Text("Home")
//        })
//        AnalyticsView()
//        .tabItem({
//          Image("tabicon-book")
//          Text("Analytics")
//        })
//      InstagramView()
//        .tabItem({
//          Image("tabicon-avocado")
//          Text("Instagram Data")
//        })
//        ResourcesView()
//          .tabItem({
//            Image("tabicon-avocado")
//            Text("Resources")
//          })
//      ProfileView()
//        .tabItem({
//          Image("tabicon-settings")
//          Text("Settings")
//        })
    }
    .accentColor(Color.primary)
  }
}

struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    AppView()
      .previewDevice("iPhone 12 Pro")
      .environment(\.colorScheme, .dark)
  }
}
