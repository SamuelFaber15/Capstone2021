//
//  ContentView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 1/22/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Login()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Login : View {
    
    @State var user = ""
    @State var password = ""
    var body : some View{
        VStack{
            Image("TacoBell")
            
            Text("Sign In").fontWeight(.heavy).font(.largeTitle).padding([.top,.bottom],20)
            
            VStack(alignment: .leading){
                Text("Username").font(.headline).fontWeight(.light)
                
                HStack{
                    TextField("Enter Username", text: $user)
                
                }
                Divider()
            }.padding(.bottom, 15)
            VStack(alignment: .leading){
                Text("Password").font(.headline).fontWeight(.light)
                
                HStack{
                    SecureField("Enter Your Password", text: $password)
                
                }
                Divider()
            }
            
            HStack{
                Spacer()
                
                Button(action: {
                    
                }){
                    Text("Forgot Password?").foregroundColor(Color.gray.opacity(0.5))
                }
            }.padding(.horizontal, 6)
            signInButtonView()
        }.padding()
    }
}

struct signInButtonView : View{
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
            
            Text("Don't Have An Account?").foregroundColor(Color.gray.opacity(0.5))
            
            Button(action: signIn){
                Text("Sign Up")
            }.foregroundColor(Color.purple)
        }
    }
}

func signIn() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: SignInContentView())
        window.makeKeyAndVisible()
    }
}
