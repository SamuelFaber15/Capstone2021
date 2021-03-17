//
//  HomeContentView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 1/23/21.
//

import SwiftUI
import Firebase
struct HomeView: View {
    @EnvironmentObject var userInfo: UserInfo
    var body: some View {
        NavigationView{
            ZStack {
                
                Rectangle().foregroundColor(.clear).background(LinearGradient(gradient: Gradient(colors: [Color("HomeColor2"), Color("HomeColor")]), startPoint: .topLeading, endPoint: .bottomTrailing)).ignoresSafeArea()
                VStack{
            Text("Welcome \(userInfo.user.name)!\n Hope your day is going great!")
                    VStack{
                        HStack{
                            VStack{
                                NavigationLink(destination: ResourcesView()){
                                    Image("ResourcesIcon")
                                        .renderingMode(.original)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                }
                            }
                            VStack{
                                NavigationLink(destination: AnalyticsView()){
                                    Image("AnalyticsIcon")
                                        .renderingMode(.original)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                }
                            }.padding(.leading, 50)
                        }.padding(.top, 70)
                        HStack{
                            VStack{
                                NavigationLink(destination: ResourcesView()){
                                    Text("My Resources")
                                }
                            }
                            VStack{
                                NavigationLink(destination: AnalyticsView()){
                                    Text("My Analytics")
                                }
                            }.padding(.leading, 50)
                        }
                        NavigationLink(destination: InstagramView()){
                            VStack{
                                HStack{
                                    Image("instagram_icon")
                                        .renderingMode(.original)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                }
                                HStack{
                                    Text("Instagram Data")
                                }
                            }
                        }.padding(.top, 70)
                    }
                }
                .multilineTextAlignment(.center)
                .navigationBarItems(leading: Button("Log Out") {
                    FBAuth.logout { (result) in
                        print("Logged out")
                    }
                },
                trailing: NavigationLink(destination: ProfileView()) {
                    Text("Profile")
                })
                .onAppear {
                    guard let uid = Auth.auth().currentUser?.uid else {
                        return
                    }
                    FBFirestore.retrieveFBUser(uid: uid) { (result) in
                        switch result {
                        case .failure(let error):
                            print(error.localizedDescription)
                            // Display some kind of alert to your user here. (It shouldn't happen)
                        case .success(let user):
                            self.userInfo.user = user
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

