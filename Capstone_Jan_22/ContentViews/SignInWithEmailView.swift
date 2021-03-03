//
//  SignInWithEmailView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 1/26/21.
//

import SwiftUI

struct SignInWithEmailView: View {
    @EnvironmentObject var userInfo: UserInfo
    @State var user: UserViewModel = UserViewModel()
    @Binding var showSheet: Bool
    @Binding var action:LoginView.Action?
    
    @State private var showAlert = false
    @State private var authError: EmailAuthError?
    var body: some View {
        ZStack{
//            Color("HomeColor")
//                .ignoresSafeArea()
            
            Rectangle().foregroundColor(.clear).background(LinearGradient(gradient: Gradient(colors: [Color("HomeColor2"), Color("HomeColor")]), startPoint: .topLeading, endPoint: .bottomTrailing)).ignoresSafeArea()
            
        VStack{
            Image("HomeImage")
                .resizable()
                .frame(width: 200.0, height: 200.0)
            Text("SideKick").font(.largeTitle)
                .multilineTextAlignment(.center)

        
        VStack {
            TextField("Email Address", text: self.$user.email)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            SecureField("Password", text:$user.password)
            HStack {
                Spacer()
                Button(action: {
                    self.action = .resetPW
                    self.showSheet = true
                }){
                    Text("Forgot Password?")
                }
            }.padding(.bottom)
            VStack(spacing: 10) {
                Button(action: {
                    FBAuth.authenticate(withEmail: self.user.email,
                                        password: self.user.password) { (result) in
                        switch result {
                        case .failure(let error):
                            self.authError = error
                            self.showAlert = true
                        case .success ( _):
                            print("Signed in")
                        }
                    }
                }){
                    Text("Login").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                        .opacity(user.loginIsComplete ? 1 : 0.75)
                }.disabled(!user.loginIsComplete).background(Color("Color"))
                .clipShape(Capsule())
                .padding(.top,45)
                .opacity(user.loginIsComplete ? 1 : 0.75)
                
                HStack{
                    Text("Don't Have An Account?").foregroundColor(Color.black.opacity(0.5))
                Button(action: {
                    self.action = .signUp
                    self.showSheet = true
                }) {
                    Text("Sign Up")
                }
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Login Error"), message: Text(self.authError?.localizedDescription ?? "Unkown Error"), dismissButton: .default(Text("Ok")) {
                    if self.authError == .incorrectPassword {
                        self.user.password = ""
                    } else {
                        self.user.password = ""
                        self.user.email = ""
                    }
                })
            }
        }
//        .padding(.top, 100)
        .frame(width: 300)
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
    }
    }
}


// OLD CODE!! Keeping in here just for reference for now (1/27). Will likely delete.

//struct SignInWithEmailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInWithEmailView()
//    }
//}
