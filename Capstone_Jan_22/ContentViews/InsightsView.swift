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
    
    var recipes: [Recipe] = recipesData
    
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
                ForEach(recipes) { item in
                    InsightsListView(recipe: item)
                }
          }
          .frame(maxWidth: 640)
          .padding([.top, .leading, .trailing])
          .padding(.top, 30)
          
          // MARK: - FOOTER
          
          VStack(alignment: .center, spacing: 20) {
            Text("All About YOU")
              .fontWeight(.bold)
              .modifier(TitleModifier())
            Text("You are always enough. You deserve the best.")
              .font(.system(.body, design: .serif))
              .multilineTextAlignment(.center)
              .foregroundColor(Color.gray)
              .frame(minHeight: 60)
          }
          .frame(maxWidth: 640)
          .padding()
          .padding(.bottom, 85)
        }
      } else if userInfo.user.captions.count == 0 {
        
        NavigationLink(destination: InstagramView()) {
        Image("instagram_icon")
            .renderingMode(.original)
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
        Text("Connect to your Instagram")
        }
//                    Button(action: { addItems() }) {
//                        HStack {
//                            Text("Add Selected Items")
//                        }
//                    }
        if self.testUserData.user_id != 0 {
        Button(action: {
            self.instagramApi.getInstagramUser(testUserData: self.testUserData) { (user) in
                self.instagramUser = user
//                            self.signedIn.toggle()
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
                    addItems()
                }
                    
            } else {
                print("Not signed in")
            }
            }
        }){
            Text("Pull Instagram Captions")
                .font(.headline)
                .padding()
        }
        .sheet(isPresented: self.$presentAuth) {
                WebView(presentAuth: self.$presentAuth, testUserData: self.$testUserData, instagramApi: self.$instagramApi)
        }
        }
      } else {
          Button(action: { fetchCaptions() }) {
              HStack {
                  Text("Run Analysis")
              }
              .padding(40)
          }
//              if userInfo.user.score != "" {
//                  Text(userInfo.user.score)
//                  Text("Updated Score:")
//                  Text(sentimentLabel)
//              } else {
//                  Text(sentimentLabel)
//              }
      }
      }.navigationBarItems(
        trailing: Group {
            
            if self.userInfo.user.captions.count > 0 {
            NavigationLink(destination: InstagramView()) {
            Text("Refresh Data")
        }
            }
        })
    }
        .sheet(isPresented: self.$presentAuth) {
                WebView(presentAuth: self.$presentAuth, testUserData: self.$testUserData, instagramApi: self.$instagramApi)
        }
        .edgesIgnoringSafeArea(.all)
        .padding(0)
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
    func fetchCaptions() {
                //need to pass this array into our classifier model to get an array of predicted sentiments
                var captions = [SentClassifierInput]()
                print(self.userInfo.user.captions.count)
                for caption in self.userInfo.user.captions {
                    let captionForClassification = SentClassifierInput(text: caption as! String)
                    captions.append(captionForClassification)
                }
                
                self.makePrediction(with: captions)
    }
    
    func makePrediction(with captions:[SentClassifierInput]) {
        do {
            let predictions = try self.sentimentClassifer.predictions(inputs: captions)
            var sentimentScore = 0
            print(predictions.count)
            let predictionCount = predictions.count
            for prediction in predictions{
                print(prediction.label)
                let sentiment = prediction.label
                
                if sentiment == "pos" {
                    sentimentScore += 1
                } else if sentiment == "neg" {
                    sentimentScore -= 1
                }
            }
            updateUI(with: sentimentScore, predictionsCount: predictionCount)
        } catch{
            print("There was an error w/ making a prediction, \(error)")
        }
    }
    
    func updateUI(with sentimentScore: Int, predictionsCount: Int) {
        print("7834")
        print(predictionsCount)
        let percentageNum = round(((Double(sentimentScore) / Double(predictionsCount))*100))
        print(percentageNum)
        print(sentimentScore/predictionsCount)
        if percentageNum > 75 {
            self.sentimentLabel = "😍" + String(sentimentScore) + " " + String(percentageNum) //sentiment label is connected to the UI
        } else if percentageNum > 50 {
            self.sentimentLabel = "😀" + String(sentimentScore) + " " + String(percentageNum)
        }else if percentageNum > 40 {
            self.sentimentLabel = "🙂" + String(sentimentScore) + " " + String(percentageNum)
        }else if percentageNum == 30 {
            self.sentimentLabel = "😶" + String(sentimentScore) + " " + String(percentageNum)
        }else if percentageNum > 20 {
            self.sentimentLabel = "😕" + String(sentimentScore) + " " + String(percentageNum)
        }else if percentageNum > 10 {
            self.sentimentLabel = "🥺" + String(sentimentScore) + " " + String(percentageNum)
        }else {
            self.sentimentLabel = "😤" + String(sentimentScore) + " " + String(percentageNum)
        }
        let db = Firestore.firestore()
        print("***here***")
        print(percentageNum)
        db.collection("users").document(self.userInfo.user.uid).updateData(["score": String(percentageNum)])
        self.userInfo.configureFirebaseStateDidChange()
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
