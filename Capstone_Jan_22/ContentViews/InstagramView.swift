// Prints out your instagram data - ONLY Pulls in the new captions

//  InstagramView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 2/11/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct InstagramView: View {
    
    //MARK:- State variables
    @State var presentAuth = false
    
    @State var testUserData = InstagramTestUser(access_token: "", user_id: 0)
    
    @State var instagramApi = InstagramApi.shared
    
    @State var signedIn = false
    
    @State var instagramUser: InstagramUser? = nil
    
    @State var post_caption: [String] = []
    
    @State var instagramImage = UIImage(imageLiteralResourceName: "instagram_background")

    @State var selections: [String] = []
    
    @EnvironmentObject var userInfo: UserInfo
    
    init() {
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
    
    //MARK:- View Body
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle().foregroundColor(.clear).background(LinearGradient(gradient: Gradient(colors: [Color("InstaColor1"), Color("InstaColor2"), Color("InstaColor3")]), startPoint: .top, endPoint: .bottom)).ignoresSafeArea()
                ScrollView{
                    
                    if userInfo.user.captions.count > 0 {
                        ForEach(userInfo.user.captions as! [String], id: \.self){caption in
                            Text(String(caption))
                        }
                    }
                    Button(action: {
                        if self.testUserData.user_id == 0 {
                            self.presentAuth.toggle()
                        } else {
                            self.instagramApi.getInstagramUser(testUserData: self.testUserData) { (user) in
                                self.instagramUser = user
                                self.signedIn.toggle()
                            }
                        }
                    }) {
                    Image("instagram_icon")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                    }
                    Button(action: { addItems() }) {
                        HStack {
                            Text("Add Selected Items")
                        }
                    }
                    Button(action: {
                        if self.instagramUser != nil {
                            self.instagramApi.getMediaData(testUserData: self.testUserData) { (media) in
                                for caption in media.data {
                                    post_caption.append(caption.caption ?? "No Caption")
                                    if userInfo.user.captions.count > 0 {
                                        if userInfo.user.captions.contains(where: { ($0 as! String) == caption.caption }) {
                                            //check if value is already in array
                                        }else{
                                            selections.append(caption.caption ?? "No Caption")
                                        }
                                    }else{
                                        selections.append(caption.caption ?? "No Caption")
                                    }
                                }
                                for post in post_caption {
                                    print(post)
                                }
                            }
                                
                        } else {
                            print("Not signed in")
                        }
                    }){
                        Text("Fetch Captions")
                            .font(.headline)
                            .padding()
                    }
                }
            }
            .sheet(isPresented: self.$presentAuth) {
                    WebView(presentAuth: self.$presentAuth, testUserData: self.$testUserData, instagramApi: self.$instagramApi)
            }.actionSheet(isPresented: self.$signedIn) {
            let actionSheet = ActionSheet(title: Text("Signed in:"), message: Text("with account: @\(self.instagramUser!.username)"),buttons: [.default(Text("OK"))])
                return actionSheet
            }
        }
    }
    
    func addItems() {
        let db = Firestore.firestore()
        print("***here***")
        print(self.selections)
        if selections.count == 0{
            print("no captions added")
        }else{
            db.collection("users").document(self.userInfo.user.uid).updateData(["captions": FieldValue.arrayUnion(selections)])
            self.userInfo.configureFirebaseStateDidChange()
        }
    }
}

//MARK:- Simulator preview
struct InstagramView_Previews: PreviewProvider {
    static var previews: some View {
        InstagramView()
    }
}
