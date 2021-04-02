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
            Image("tabicon-resources2")
            Text("Resources")
          })
            .tag(1)
        InsightsView()
          .tabItem({
            Image("tabicon-insights2")
            Text("Insights")
          })
            .tag(2)
//        WelcomeView()
        HomeView_Looping()
          .tabItem({
            Image("tabicon-home2")
            Text("Home")
          })
            .tag(3)

//        GoalsView()
        GoalsView_Tut(coreDM: CoreDataManager())
//        AddGoalView_Tut(coreDM: CoreDataManager())
            .tabItem({
            Image("tabicon-goals2")
            Text("Goals")
          })
            .tag(4)
        SettingsView()
          .tabItem({
            Image("tabicon-settings3")
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
