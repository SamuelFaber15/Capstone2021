//
//  InsightsView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 3/22/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct InsightsView: View {
    // MARK: - PROPERTIES
    
    var insights: [Insight] = insightsData
    
    @State var presentAuth = false
    
    @State var testUserData = InstagramTestUser(access_token: "", user_id: 0)
    
    @State var instagramApi = InstagramApi.shared
    
    @State var signedIn = false
    
    @State var instagramUser: InstagramUser? = nil
    
    @State var post_caption: [String] = []
    
    @State var instagramImage = UIImage(imageLiteralResourceName: "instagram_background")

    @State var selections: [String] = []
    
    @EnvironmentObject var userInfo: UserInfo
    
    let sentimentClassifer = SentClassifier()
    
    @State var sentimentLabel = ""
    
    var body: some View {
        
        NavigationView{
      ScrollView(.vertical, showsIndicators: false) {
        if userInfo.user.score != "" {
        VStack(alignment: .center, spacing: 20) {
          VStack(alignment: .center, spacing: 20) {
                ForEach(insights) { item in
                    InsightsListView(insight: item)
                }
          }
          .frame(maxWidth: 640)
          .padding([.top, .leading, .trailing])
          .padding(.top, 30)
          
          // MARK: - FOOTER
          
          VStack(alignment: .center, spacing: 20) {
//            Text("Never Forget -")
//              .fontWeight(.bold)
//              .modifier(TitleModifier())
            Text("Don't forget - you're doing better than you think you are.")
              .font(.system(.body, design: .serif))
              .multilineTextAlignment(.center)
              .foregroundColor(Color.gray)
              .frame(minHeight: 60)
          }
          .frame(maxWidth: 640)
          .padding()
          .padding(.bottom, 85)
        }
      }
//        else if userInfo.user.captions.count == 0 {
        if userInfo.user.captions.count == 0 {
            VStack{
            HStack(alignment: .top, spacing: 10) {
            Text("Insights")
              .font(.system(.title, design: .serif))
              .fontWeight(.bold)
              .foregroundColor(Color("ColorGreenMedium"))
          }

          VStack(alignment: .center, spacing: 5) {
            Text("Our data model has been designed to give personalized feedback and insights for each user. When you connect to your instagram we will collect and analyze the captions of your posts and provide you with insights.")
                .font(.system(.body, design: .serif))
                .foregroundColor(Color.gray)
                .italic()
                .padding([.leading, .bottom, .trailing, .top])

          }
        }
        }
        NavigationLink(destination: InstagramView()) {
            if userInfo.user.captions.count == 0 {
                Image("instagram_icon_green")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                Text("Connect to your Instagram")
                    .italic()
                    .foregroundColor(Color.gray)
              }
        }
        
        
//      }
      }.navigationBarItems(
        trailing: Group {
            
            if self.userInfo.user.captions.count > 0 {
            NavigationLink(destination: InstagramView()) {
            Text("Refresh Data")
        }
            }
        })
    }
    }
  }



  struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
      content
        .font(.system(.title, design: .serif))
        .foregroundColor(Color("ColorGreenAdaptive"))
        .padding(8)
    }
  }

  struct InsightsView_Previews2: PreviewProvider {
    static var previews: some View {
      Group {
        InsightsView()
      }
    }
  }
