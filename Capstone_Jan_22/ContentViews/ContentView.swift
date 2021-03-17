//  First view that pulls up
//  ContentView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 1/22/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userInfo: UserInfo
    var body: some View {
        Group {
            // if the user is authenticated, it takes them to home
            if userInfo.isUserAuthenticated == .undefined {
                Text("Loading...")
            } else if userInfo.isUserAuthenticated == .signedOut {
            // if not, takes them to login view
                LoginView()
            } else {
                HomeView()
            }
        }
        .onAppear {
            self.userInfo.configureFirebaseStateDidChange()
        }
        
    }
}

struct LoginContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



// OLD CODE!! Keeping in here just for reference for now (1/27). Will likely delete.


//struct LoginView : View {
//
//    @State var user = ""
//    @State var password = ""
//    var body : some View{
//        VStack{
//            Image("TacoBell")
//
//            Text("Sign In").fontWeight(.heavy).font(.largeTitle).padding([.top,.bottom],20)
//
//            VStack(alignment: .leading){
//
//                HStack{
//                    TextField("Email", text: $user)
//
//                }
//                Divider()
//            }.padding(.bottom, 15)
//            VStack(alignment: .leading){
//
//                HStack{
//                    SecureField("Password", text: $password)
//                    Button(action: {
//
//                    }){
//                        Text("Forgot Password?").foregroundColor(Color.blue.opacity(0.5))
//                    }
//                }
//                Divider()
//            }
//
//            HStack{
//                Spacer()
//            }
//            signInButtonView()
//        }.padding()
//    }
//}
//
//struct signInButtonView : View{
//    var body : some View{
//
//        VStack{
//
//            Button(action: homePage){
//                Text("Sign In").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
//            }.background(Color("Color"))
//            .clipShape(Capsule())
//            .padding(.top,45)
//        }
//        HStack{
//
//            Text("Don't Have An Account?").foregroundColor(Color.gray.opacity(0.5))
//
//            Button(action: signUp){
//                Text("Sign Up")
//            }.foregroundColor(Color.purple)
//        }
//    }
//}


