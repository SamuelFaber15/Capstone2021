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
//            SignInWithAppleView().frame(width: 200, height: 50)
        }
        
        // Seperate view, called by .sheet
            .sheet(isPresented: $showSheet) {
                if self.action == .signUp {
                    SignUpView()
                } else {
                    ForgotPasswordView()
                }
            }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
