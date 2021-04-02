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
    
    @State var captionsAddedLabel = ""
    
    let sentimentClassifer = SentClassifier()
    
//    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
//    init() {
//        UINavigationBar.appearance().barTintColor = .clear
//        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
//    }
    
    //MARK:- View Body
    var body: some View {
//        NavigationView {
            ZStack {
                Rectangle().foregroundColor(.clear)
                    
//                    .background(LinearGradient(gradient: Gradient(colors: [Color("InstaColor1"), Color("InstaColor2"), Color("InstaColor3")]), startPoint: .top, endPoint: .bottom)).ignoresSafeArea()
                
                    .background(
                      Image("mountgraphicback")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    )
                      .edgesIgnoringSafeArea(.all)

                ScrollView{
                    
//                    if userInfo.user.captions.count > 0 {
//                        ForEach(userInfo.user.captions as! [String], id: \.self){caption in
//                            Text(String(caption))
//                        }
//                    }
                    Image("instagram_icon_bg")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    HStack{
                        Text("Step 1").fontWeight(.bold)
                            .font(.system(.body, design: .serif)).padding()

                    }
                    .padding(.top,5)
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
                        Text("Connect to your Instagram").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                
                    }.background(LinearGradient(gradient: Gradient(colors: [Color("ButtonColor1"), Color("ButtonColor2"), Color("ButtonColor3")]), startPoint: .top, endPoint: .bottom))
                    .clipShape(Capsule())
                    .padding(.top,5)
//                    Button(action: { addItems() }) {
//                        HStack {
//                            Text("Add Selected Items")
//                        }
//                    }
//                    if self.testUserData.user_id != 0 {
                    HStack{
                        Text("Step 2").fontWeight(.bold)
                            .font(.system(.body, design: .serif)).padding()

                    }
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
                                self.userInfo.configureFirebaseStateDidChange()
                            }
                                
                        } else {
                            print("Not signed in")
                        }
                        }
                    }){
                        Text("Pull Instagram Captions").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                            .opacity((self.testUserData.user_id != 0) ? 1 : 0.75)
                    }.disabled((self.testUserData.user_id == 0)).background(LinearGradient(gradient: Gradient(colors: [Color("ButtonColor1"), Color("ButtonColor2"), Color("ButtonColor3")]), startPoint: .top, endPoint: .bottom))
                    .clipShape(Capsule())
                    .padding(.top,5)
                    .opacity((self.testUserData.user_id != 0) ? 1 : 0.75)
                    
                    HStack{
                        Text("Step 3").fontWeight(.bold)
                            .font(.system(.body, design: .serif)).padding()
//                            .modifier(TitleModifier())

                    }
                    Button(action: { fetchCaptions()}) {
                        AnalysisText.foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                            .opacity((userInfo.user.captions.count == 0 && selections.count == 0 || userInfo.user.captions.count != 0 && selections.count == 0 && userInfo.user.score != "") ? 0.75 : 1)
                    }.disabled((userInfo.user.captions.count == 0 && selections.count == 0 || userInfo.user.captions.count != 0 && selections.count == 0 && userInfo.user.score != "")).background(LinearGradient(gradient: Gradient(colors: [Color("ButtonColor1"), Color("ButtonColor2"), Color("ButtonColor3")]), startPoint: .top, endPoint: .bottom))
                    .clipShape(Capsule())
                    .padding(.top,5)
                    .opacity((userInfo.user.captions.count == 0 && selections.count == 0 || userInfo.user.captions.count != 0 && selections.count == 0 && userInfo.user.score != "") ? 0.75 : 1)
//                        }
                    Text(captionsAddedLabel)
                    }
//                }
            }
            .sheet(isPresented: self.$presentAuth) {
                    WebView(presentAuth: self.$presentAuth, testUserData: self.$testUserData, instagramApi: self.$instagramApi)
            }.actionSheet(isPresented: self.$signedIn) {
            let actionSheet = ActionSheet(title: Text("Signed in:"), message: Text("with account: @\(self.instagramUser!.username)"),buttons: [.default(Text("OK"))])
                return actionSheet
            }
        }
//    }
    
    func addItems() {
        let db = Firestore.firestore()
        print("***here***")
        print(self.selections)
        if selections.count == 0{
            print("no captions added")
            self.captionsAddedLabel = "No captions added"
        }else{
            db.collection("users").document(self.userInfo.user.uid).updateData(["captions": FieldValue.arrayUnion(selections)])
//            self.userInfo.configureFirebaseStateDidChange()
            self.captionsAddedLabel = String(selections.count) + " captions added! Run the Analysis!"
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
            self.captionsAddedLabel = "Success! Click back to check out your Inisghts!"
        } catch{
            print("There was an error w/ making a prediction, \(error)")
        }
    }
    
    func updateUI(with sentimentScore: Int, predictionsCount: Int) {
        // Create Date
        let date = Date()

        // Create Date Formatter
        let dateFormatter = DateFormatter()

        // Set Date/Time Style
        dateFormatter.dateStyle = .long
//        dateFormatter.timeStyle = .short

        // Set Locale
//        dateFormatter.locale = Locale(identifier: "fr")

        // Convert Date to String
        let currentScoreDate = dateFormatter.string(from: date) // 9 septembre 2020 à 12:27
        
        print("7834")
        print(predictionsCount)
        let percentageNum = round(((Double(sentimentScore) / Double(predictionsCount))*100))
        print(percentageNum)
        print(sentimentScore/predictionsCount)
        let db = Firestore.firestore()
        print("***here***")
        print(percentageNum)
        db.collection("users").document(self.userInfo.user.uid).updateData(["score": String(percentageNum)])
        db.collection("users").document(self.userInfo.user.uid).updateData(["scoreDate": String(currentScoreDate)])
        self.userInfo.configureFirebaseStateDidChange()
    }
    
    private var AnalysisText: some View {
            if userInfo.user.score == "" {
                return Text("Run Analysis")
            } else {
                return Text("Re-Run Analysis")
            }
        }
}

//MARK:- Simulator preview
struct InstagramView_Previews: PreviewProvider {
    static var previews: some View {
        InstagramView()
    }
}
