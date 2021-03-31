//
//  ResourcesBookView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 3/22/21.
//

import SwiftUI

struct MentalHealthBookView: View {
      // MARK: - PROPERTIES
      
      var resource: Resources
      var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
      @State private var showModal: Bool = false
      
      var body: some View {
        VStack(alignment: .leading, spacing: 0) {
          // CARD IMAGE
          Image(resource.image)
            .resizable()
            .scaledToFit()
            .overlay(
              HStack {
                Spacer()
                VStack {
    //              Image(systemName: "bookmark")
    //                .font(Font.title.weight(.light))
    //                .foregroundColor(Color.white)
    //                .imageScale(.small)
    //                .shadow(color: Color("ColorBlackTransparentLight"), radius: 2, x: 0, y: 0)
    //                .padding(.trailing, 20)
    //                .padding(.top, 22)
                  Spacer()
                }
              }
            )
          
          VStack(alignment: .leading, spacing: 12) {
            // TITLE
    //        Text(recipe.title)
    //          .font(.system(.title, design: .serif))
    //          .fontWeight(.bold)
    //          .foregroundColor(Color("ColorGreenMedium"))
    //          .lineLimit(1)
    //
    //        // HEADLINE
    //        Text(recipe.headline)
    //          .font(.system(.body, design: .serif))
    //          .foregroundColor(Color.gray)
    //          .italic()
            
            // RATING
    //        RecipeRatingView(recipe: recipe)
            
            // COOKING
    //        RecipeCookingView(recipe: recipe)
          }
    //      .padding()
    //      .padding(.bottom, 12)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
        .onTapGesture {
          self.hapticImpact.impactOccurred()
          self.showModal = true
        }
        .sheet(isPresented: self.$showModal) {
            ResourcesBookDetailView(resource: self.resource)
        }
      }
    }

    struct MentalHealthBookView_Previews: PreviewProvider {
      static var previews: some View {
        MentalHealthBookView(resource: mentalHealthResources[0])
          .previewLayout(.sizeThatFits)
      }
    }
