//
//  SignInContentView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 1/23/21.
//

import SwiftUI

struct SignInContentView: View {
    var body: some View {
        
        SignUp()
    }
}

struct SignInContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInContentView()
    }
}

struct SignUp : View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    var body : some View{
        VStack{
            Image("TacoBell")
            
            Text("Sign Up").fontWeight(.heavy).font(.largeTitle).padding([.top,.bottom],20)
            
            VStack(alignment: .leading){
                
                HStack{
                    TextField("First Name", text: $firstName)
                
                }
                Divider()
            }.padding(.bottom, 15)
            VStack(alignment: .leading){
                
                HStack{
                    TextField("Last Name", text: $lastName)
                
                }
                Divider()
            }.padding(.bottom, 15)
            VStack(alignment: .leading){
                
                HStack{
                    TextField("Email", text: $email)
                
                }
                Divider()
            }.padding(.bottom, 15)
            VStack(alignment: .leading){
                
                HStack{
                    SecureField("Password", text: $password)
                
                }
                Divider()
            }.padding(.bottom, 15)
            VStack(alignment: .leading){
                
                HStack{
                    SecureField("Confirm Password", text: $confirmPassword)
                
                }
                Divider()
            }
            }.padding(.horizontal, 6)
            signUpButtonView()
    }
}

struct signUpButtonView : View{
    var body : some View{
        
        VStack{
            
            Button(action: {
            }){
                Text("Sign In").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
            }.background(Color.red)
            .clipShape(Capsule())
            .padding(.top,45)
        }
        HStack{
            
            Text("Already Have An Account?").foregroundColor(Color.gray.opacity(0.5))
            
            Button(action: loginPage){
                Text("Log In")
            }.foregroundColor(Color.purple)
        }
    }
}

func loginPage() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: ContentView())
        window.makeKeyAndVisible()
    }
}

