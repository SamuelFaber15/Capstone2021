//
//  InsightsListView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 3/22/21.
//

import SwiftUI

struct InsightsListView: View {
    // MARK: - PROPERTIES
    
    var insight: Insight
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    @State private var showModal: Bool = false
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        let numberFormatter = NumberFormatter()
        let number = numberFormatter.number(from: userInfo.user.score)
        let numberFloatValue = number!.intValue
        if insight.scoreLow <= numberFloatValue && numberFloatValue <= insight.scoreHigh {
          let headlineText = insight.headline.replacingOccurrences(of: "@User", with: userInfo.user.name)
          let dateText = insight.title.replacingOccurrences(of: "@Date", with: userInfo.user.scoreDate)
      VStack(alignment: .leading, spacing: 0) {
        // CARD IMAGE
        Image(insight.image)
          .resizable()
          .scaledToFit()
        
        VStack(alignment: .leading, spacing: 12) {
          // TITLE
          Text(dateText)
            .font(.system(.title, design: .serif))
            .fontWeight(.bold)
            .foregroundColor(Color("ColorGreenMedium"))
            .lineLimit(1)
          
          // HEADLINE
          Text(headlineText)
            .font(.system(.body, design: .serif))
            .foregroundColor(Color.gray)
            .italic()
          
          // RATING
  //        RecipeRatingView(recipe: recipe)
          
          // COOKING
  //        RecipeCookingView(recipe: recipe)
        }
        .padding()
        .padding(.bottom, 12)
      }
      .background(Color.white)
      .cornerRadius(12)
      .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
      .onTapGesture {
        self.hapticImpact.impactOccurred()
        self.showModal = true
      }
      .padding(.top, 30)
      .sheet(isPresented: self.$showModal) {
        InsightsListDetailView(insight: self.insight)
      }
    }
    }
  }

  struct InsightsListView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsListView(insight: insightsData[0])
        .previewLayout(.sizeThatFits)
    }
  }
