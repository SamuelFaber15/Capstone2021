//
//  ForgotPasswordView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 1/26/21.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State var user: UserViewModel = UserViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showAlert = false
    @State private var errString: String?
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter email address", text: $user.email).autocapitalization(.none).keyboardType(.emailAddress)
                Button(action: {
                    FBAuth.resetPassword(email: self.user.email) { (result) in
                        switch result {
                        case .failure(let error):
                            self.errString = error.localizedDescription
                        case .success( _):
                            break
                        }
                        self.showAlert = true
                    }
                }) {
                    Text("Reset").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                        .opacity(user.isEmailValid(_email: user.email) ? 1 : 0.75)
                }
                .disabled(!user.isEmailValid(_email: user.email))
                .background(Color("Color"))
                .clipShape(Capsule())
                .padding(.top,45)
                .opacity(user.loginIsComplete ? 1 : 0.75)
                
                Spacer()
            }.padding(.top)
            .frame(width: 300)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .navigationBarTitle("Request a password reset", displayMode: .inline)
            .navigationBarItems(trailing: Button("Dismiss") {
                self.presentationMode.wrappedValue.dismiss()
            })
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Password Reset"),
                      message: Text(self.errString ?? "Success. Reset email sent successfully. Check your email"),
                      dismissButton: .default(Text("Ok")) {
                        self.presentationMode.wrappedValue.dismiss()
                      })
            }
        }
    }
}


// OLD CODE!! Keeping in here just for reference for now (1/27). Will likely delete.

//struct ForgotPasswordView_Previews: PreviewProvider {
//    static var previews: some View {
//        ForgotPasswordView()
//    }
//}
