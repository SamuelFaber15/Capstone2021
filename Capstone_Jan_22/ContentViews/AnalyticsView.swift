//  Blank analytics view page

//  AnalyticsView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 3/2/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct AnalyticsView: View {
    let sentimentClassifer = SentClassifier()
    @EnvironmentObject var userInfo: UserInfo
    @State var sentimentLabel = ""
    var body: some View {
        VStack{
        Button(action: { fetchCaptions() }) {
            HStack {
                Text("Run Analysis")
            }
        }
            if userInfo.user.score != "" {
                Text(userInfo.user.score)
                Text("Updated Score:")
                Text(sentimentLabel)
            } else {
                Text(sentimentLabel)
            }
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

struct AnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticsView()
    }
}
