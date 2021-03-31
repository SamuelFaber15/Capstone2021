//
//  ResourcesBookDetailView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 3/22/21.
//

import SwiftUI

struct ResourcesBookDetailView: View {
    // MARK: - PROPERTIES
    
    var resource: Resources
    
    @State private var pulsate: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center, spacing: 0) {
          // IMAGE
          Image(resource.image)
            .resizable()
            .scaledToFit()
          
          Group {
            // TITLE
            Text(resource.title)
              .font(.title)
              .fontWeight(.semibold)
              .multilineTextAlignment(.center)
              .foregroundColor(Color("ColorGreenAdaptive"))
              .padding(.top, 10)
            
            // RATING
  //          RecipeRatingView(resource: resource)
            
            // COOKING
  //          RecipeCookingView(resource: resource)
            
            // INGREDIENTS
//              Text("Insights")
//                  .font(.largeTitle)
//              .fontWeight(.ultraLight)
//              .modifier(TitleModifier())
            
////////////            THIS IS FOR THE NOTES
//            VStack(alignment: .leading, spacing: 5) {
//              ForEach(resource.notes, id: \.self) { item in
//                VStack(alignment: .leading, spacing: 5) {
//                  Text(item)
//                    .font(.footnote)
//                      .fontWeight(.thin)
//                      .multilineTextAlignment(.center)
//                      .padding([.leading, .bottom, .trailing])
//  //                Divider()
//                }
//              }
//            }
            
            // INSTRUCTIONS
//              Image("leaf")
//                  .padding(.all)
//
//              Text("What Now?")
//                  .font(.largeTitle)
//              .fontWeight(.ultraLight)
//              .modifier(TitleModifier())
            
            ForEach(resource.instructions, id: \.self) { item in
              VStack(alignment: .center, spacing: 5) {
//                Image(systemName: "chevron.down.circle")
//                  .resizable()
//                  .frame(width: 42, height: 42, alignment: .center)
//                  .imageScale(.large)
//                  .font(Font.title.weight(.ultraLight))
//                  .foregroundColor(Color("ColorGreenAdaptive"))
                
                  Text(item)
                      .fontWeight(.thin)
                  .lineLimit(nil)
                  .multilineTextAlignment(.center)
                      .font(.body)
                  .frame(minHeight: 100)
              }
            }
          }
          .padding(.horizontal, 24)
          .padding(.vertical, 12)
        }
      } // END OF VSTACK
      .edgesIgnoringSafeArea(.top)
      .overlay(
        HStack {
          Spacer()
          VStack {
            Button(action: {
              // ACTION
              self.presentationMode.wrappedValue.dismiss()
            }, label: {
              Image(systemName: "chevron.down.circle.fill")
                .font(.title)
                .foregroundColor(Color.white)
                .shadow(radius: 4)
                .opacity(self.pulsate ? 1 : 0.6)
                .scaleEffect(self.pulsate ? 1.2 : 0.8, anchor: .center)
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
            })
              .padding(.trailing, 20)
              .padding(.top, 24)
            Spacer()
          }
        }
      )
      .onAppear() {
        self.pulsate.toggle()
      }
    }
  }

  struct ResourcesBookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ResourcesBookDetailView(resource: mentalHealthResources[0])
    }
  }
