//
//  SignUpContentView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 1/23/21.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var userInfo: UserInfo
    @State var user: UserViewModel = UserViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State private var showError = false
    @State private var errorString = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    VStack(alignment: .leading) {
                        TextField("Full Name", text: self.$user.fullname).autocapitalization(.words)
                        if !user.validNameText.isEmpty {
                            Text(user.validNameText).font(.caption).foregroundColor(.red)
                        }
                    }
                    VStack(alignment: .leading) {
                        TextField("Email Address", text: self.$user.email).autocapitalization(.none).keyboardType(.emailAddress)
                        if !user.validEmailAddressText.isEmpty {
                            Text(user.validEmailAddressText).font(.caption).foregroundColor(.red)
                        }
                    }
                    VStack(alignment: .leading) {
                        SecureField("Password", text: self.$user.password)
                        if !user.validPasswordText.isEmpty {
                            Text(user.validPasswordText).font(.caption).foregroundColor(.red)
                        }
                    }
                    VStack(alignment: .leading) {
                        SecureField("Confirm Password", text: self.$user.confirmPassword)
                        if !user.passwordsMatch(_confirmPW: user.confirmPassword) {
                            Text(user.validConfirmPasswordText).font(.caption).foregroundColor(.red)
                        }
                    }
                }.frame(width: 300)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                VStack(spacing: 20) {
                    Button(action: {
                        FBAuth.createUser(withEmail: self.user.email,
                                          name: self.user.fullname,
                                          captions: [],
                                          password: self.user.password) {( result) in
                            switch result {
                            case .failure(let error):
                                self.errorString = error.localizedDescription
                                self.showError = true
                            case .success( _):
                                print("Account creation successful")
                            }
                        }
                    }) {
                        Text("Register").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                            .opacity(user.isSignUpComplete ? 1 : 0.75)
                    }.background(Color("Color"))
                    .clipShape(Capsule())
                    .padding(.top,45)
                    .opacity(user.loginIsComplete ? 1 : 0.75)
                    .disabled(!user.isSignUpComplete)
                    Spacer()
                }.padding()
            }.padding(.top)
            .alert(isPresented: $showError){
                Alert(title: Text("Error creating account"), message: Text(self.errorString), dismissButton: .default(Text("Ok")))
            }
            .navigationBarTitle("Sign Up", displayMode: .inline)
            .navigationBarItems(trailing: Button("Dismiss") {
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}



// OLD CODE!! Keeping in here just for reference for now (1/27). Will likely delete.

//struct SignUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpView()
//    }
//}
//
//struct SignUp : View {
//
//    @State var firstName = ""
//    @State var lastName = ""
//    @State var email = ""
//    @State var password = ""
//    @State var passwordConfirm = ""
//    var body : some View{
//        VStack{
//            Image("TacoBell")
//
//            Text("Sign Up").fontWeight(.heavy).font(.largeTitle).padding([.top,.bottom],20)
//
//            VStack(alignment: .leading){
//
//                HStack{
//                    TextField("First Name", text: $firstName)
//
//                }
//                Divider()
//            }.padding(.bottom, 15)
//            VStack(alignment: .leading){
//
//                HStack{
//                    TextField("Last Name", text: $lastName)
//
//                }
//                Divider()
//            }.padding(.bottom, 15)
//            VStack(alignment: .leading){
//
//                HStack{
//                    TextField("Email", text: $email)
//
//                }
//                Divider()
//            }.padding(.bottom, 15)
//            VStack(alignment: .leading){
//
//                HStack{
//                    SecureField("Password", text: $password)
//
//                }
//                Divider()
//            }.padding(.bottom, 15)
//            VStack(alignment: .leading){
//
//                HStack{
//                    SecureField("Confirm Password", text: $passwordConfirm)
//
//                }
//                Divider()
//            }
//            }.padding(.horizontal, 6)
//           signUpButtonView()
//    }
//}

//struct signUpButtonView : View{
//    var body : some View{
//
//        VStack{
//
//            Button(action: signUpAction (password: $password, email: $email, passwordConfirm: $passwordConfirm)){
//                Text("Sign Up").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
//            }.background(Color.red)
//            .clipShape(Capsule())
//            .padding(.top,45)
//        }
//        HStack{
//
//            Text("Already Have An Account?").foregroundColor(Color.gray.opacity(0.5))
//
//            Button(action: loginPage){
//                Text("Log In")
//            }.foregroundColor(Color.purple)
//        }
//    }
//}
//
//// .navigationbarbackbuttonhidden(true)
//
//func signUpAction(_ sender: Any) {
//if password.text != passwordConfirm.text {
//let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
//let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//
//alertController.addAction(defaultAction)
//self.present(alertController, animated: true, completion: nil)
//        }
//else{
//Auth.auth().createUser(withEmail: email.text!, password: password.text!){ (user, error) in
// if error == nil {
//   self.performSegue(withIdentifier: "signupToHome", sender: self)
//                }
// else{
//   let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
//   let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//
//    alertController.addAction(defaultAction)
//    self.present(alertController, animated: true, completion: nil)
//       }
//            }
//      }
//}
