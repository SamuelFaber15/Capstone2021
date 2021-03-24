//
//  InsightsView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 3/22/21.
//

import SwiftUI

struct InsightsView: View {
    // MARK: - PROPERTIES
    
    var recipes: [Recipe] = recipesData
    
    var body: some View {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center, spacing: 20) {
          
          VStack(alignment: .center, spacing: 20) {
            ForEach(recipes) { item in
                InsightsListView(recipe: item)
            }
          }
          .frame(maxWidth: 640)
          .padding([.top, .leading, .trailing])
          
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
      }
      .edgesIgnoringSafeArea(.all)
      .padding(0)
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
