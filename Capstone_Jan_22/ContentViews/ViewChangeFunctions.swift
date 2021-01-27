//
//  ViewChangeFunctions.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 1/25/21.
//

import SwiftUI

func loginPage() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: ContentView())
        window.makeKeyAndVisible()
    }
}


func homePage() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: HomeView())
        window.makeKeyAndVisible()
    }
}

func signUp() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: SignUpView())
        window.makeKeyAndVisible()
    }
}
