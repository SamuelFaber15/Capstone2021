// User login function

//  SignInWithEmailView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 1/26/21.
//

import SwiftUI
enum ActiveSheet: Identifiable {
    case first, second
    
    var id: Int {
        hashValue
    }
}
struct SignInWithEmailView: View {
    @State var activeSheet: ActiveSheet?
    @EnvironmentObject var userInfo: UserInfo
    @State var user: UserViewModel = UserViewModel()
    @Binding var showSheet: Bool
    @Binding var action:LoginView.Action?
    
    @State private var showAlert = false
    @State private var authError: EmailAuthError?
    var body: some View {
        ZStack{
            Image("backgroundimage").resizable()
                .aspectRatio(contentMode: .fill).ignoresSafeArea()

        VStack{
            Image("logo2")
                .resizable()
                .frame(width: 200.0, height: 280.0).padding(.bottom, 30)

        
        VStack {
            TextField("Email Address", text: self.$user.email)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            SecureField("Password", text:$user.password)
            HStack {
                Spacer()
                Button(action: {
                    activeSheet = .first
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
                }.disabled(!user.loginIsComplete)              .background(LinearGradient(gradient: Gradient(colors: [Color("ButtonColor1"), Color("ButtonColor2"), Color("ButtonColor3")]), startPoint: .top, endPoint: .bottom))

                .clipShape(Capsule())
                .padding(.top,45)
                .opacity(user.loginIsComplete ? 1 : 0.75)
                                
                HStack{
                    Text("Don't Have An Account?").foregroundColor(Color.black.opacity(0.5))
                Button(action: {
                    activeSheet = .second
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
        .sheet(item: $activeSheet) { item in
            switch item {
            case .first:
                ForgotPasswordView()
            case .second:
                SignUpView()
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
