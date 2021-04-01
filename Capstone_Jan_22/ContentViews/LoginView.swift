//  Login view

//  LoginContentView2.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 1/26/21.
//

import SwiftUI

struct LoginView: View {
    enum Action {
        case signUp, resetPW, noValue
    }
    @State private var showSheet = false
    @State private var action: Action?
    var body: some View {
        VStack {
            SignInWithEmailView(showSheet: $showSheet, action: $action)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
