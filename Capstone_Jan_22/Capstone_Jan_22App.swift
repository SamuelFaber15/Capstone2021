//
//  Capstone_Jan_22App.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 1/22/21.
//

import SwiftUI
import Firebase

@main
struct Capstone_Jan_22App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            var userInfo = UserInfo()
            ContentView().environmentObject(userInfo)
        }
    }
}

class AppDelegate: NSObject,UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
    
//    let persistenceController = PersistenceController.shared
//
//    var body: some Scene {
//        WindowGroup {
//            AppView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//        }
//    }
//}


