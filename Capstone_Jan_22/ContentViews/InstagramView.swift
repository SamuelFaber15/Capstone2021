//
//  InstagramView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 2/11/21.
//

import SwiftUI
import Firebase

struct InstagramView: View {
    
    //MARK:- State variables
    @State var presentAuth = false
    
    @State var testUserData = InstagramTestUser(access_token: "", user_id: 0)
    
    @State var instagramApi = InstagramApi.shared
    
    @State var signedIn = false
    
    @State var instagramUser: InstagramUser? = nil
    
    @State var post_caption = []
    
    @State var instagramImage = UIImage(imageLiteralResourceName: "instagram_background")
    
    //MARK:- View Body
    var body: some View {
        NavigationView {
            ZStack {
                Image(uiImage: instagramImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(Edge.Set.all)
                VStack{
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
                    Button(action: {
                        if self.instagramUser != nil {
                            print("larrry")
                            self.instagramApi.getMediaData(testUserData: self.testUserData) { (media) in
                                for caption in media.data {
                                    print(caption.caption)
                                }
                            }
                        } else {
                            print("Not signed in")
                        }
                    }){
                        Text("Fetch Media to background")
                            .font(.headline)
                            .padding()
                    }
                }
            }
        }
        .sheet(isPresented: self.$presentAuth) {
            WebView(presentAuth: self.$presentAuth, testUserData: self.$testUserData, instagramApi: self.$instagramApi)
        }
        .actionSheet(isPresented: self.$signedIn) {
            
            let actionSheet = ActionSheet(title: Text("Signed in:"), message: Text("with account: @\(self.instagramUser!.username)"),buttons: [.default(Text("OK"))])
            
            return actionSheet
            
        }
    }
}

//MARK:- Simulator preview
struct InstagramView_Previews: PreviewProvider {
    static var previews: some View {
        InstagramView()
    }
}
