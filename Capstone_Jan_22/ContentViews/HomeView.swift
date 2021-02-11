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
        NavigationView {
            Text("Logged in as \(userInfo.user.name)")
                .navigationBarTitle("Firebase Login")
                .navigationBarItems(leading: NavigationLink(destination: InstagramView()) {
                    Text("Do Something")
                }, trailing: Button("Log Out") {
                    FBAuth.logout { (result) in
                        print("Logged out")
                    }
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

