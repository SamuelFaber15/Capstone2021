//
//  AnalyticsView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 3/2/21.
//

import SwiftUI

struct AnalyticsView: View {
    let sentimentClassifer = SentClassifier()
    @EnvironmentObject var userInfo: UserInfo
    @State var sentimentLabel = "this"
    var body: some View {
        Button(action: { fetchCaptions() }) {
            HStack {
                Text("Run Analysis")
            }
        }
        Text(sentimentLabel)
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
            for prediction in predictions{
                print("there")
                print(prediction.label)
                let sentiment = prediction.label
                
                if sentiment == "pos" {
                    sentimentScore += 1
                } else if sentiment == "neg" {
                    sentimentScore -= 1
                }
            }
            updateUI(with: sentimentScore)
        } catch{
            print("There was an error w/ making a prediction, \(error)")
        }
    }
    
    func updateUI(with sentimentScore: Int) {
        if sentimentScore > 20 {
            self.sentimentLabel = "😍" + String(sentimentScore) //sentiment label is connected to the UI
        } else if sentimentScore > 10 {
            self.sentimentLabel = "😀" + String(sentimentScore)
        }else if sentimentScore > 0 {
            self.sentimentLabel = "🙂" + String(sentimentScore)
        }else if sentimentScore == 10 {
            self.sentimentLabel = "😶" + String(sentimentScore)
        }else if sentimentScore > -10 {
            self.sentimentLabel = "😕" + String(sentimentScore)
        }else if sentimentScore > -20 {
            self.sentimentLabel = "🥺" + String(sentimentScore)
        }else {
            self.sentimentLabel = "😤" + String(sentimentScore)
        }
    }
}

struct AnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticsView()
    }
}
