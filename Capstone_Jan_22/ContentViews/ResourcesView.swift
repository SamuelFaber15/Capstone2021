// Resources View (can include a link to a website)

//  ResourcesView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 3/2/21.
//

import SwiftUI

struct ResourcesView: View {
    // MARK: - PROPERTIES

    var recipes: [Goals] = goalData
    
    var body: some View {
      
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center, spacing: 15) {
          // MARK: - HEADER

          HStack(alignment: .top, spacing: 10) {
                    
          }

          HStack(alignment: .center, spacing: 0) {

          }
          
          VStack(alignment: .center, spacing: 15) {
              //Just to help with spacing
              HStack(alignment: .top, spacing: 0) {
                  Text("Overall Mental Health")
                      .font(.title)
                      .fontWeight(.medium)
                      .foregroundColor(Color("ColorGreenAdaptive"))
                      .multilineTextAlignment(.leading)
                      .padding(.top)

              }

              ScrollView(.horizontal, showsIndicators: false) {
                  HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
                      
                  ForEach(recipes) { item in
                    ResourcesBookView(recipe: item)
                      .frame(width: 120, height: 220)
                      .environment(\.colorScheme, .dark)

                  }
              })
              }
              
              HStack(alignment: .top, spacing: 0) {
                  Text("Depression")
                      .font(.title)
                      .fontWeight(.medium)
                      .foregroundColor(Color("ColorGreenAdaptive"))
                      .multilineTextAlignment(.leading)
                      .padding(.top)

              }

              
              ScrollView(.horizontal, showsIndicators: false) {
                  HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
                      
                  ForEach(recipes) { item in
                    ResourcesBookView(recipe: item)
                      .frame(width: 120, height: 220)
                      .environment(\.colorScheme, .dark)

                  }
              })
              }

              HStack(alignment: .top, spacing: 0) {
                  Text("Anxiety")
                      .font(.title)
                      .fontWeight(.medium)
                      .foregroundColor(Color("ColorGreenAdaptive"))
                      .multilineTextAlignment(.leading)
                      .padding(.top)
              }
              
              ScrollView(.horizontal, showsIndicators: false) {
                  HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
                      
                  ForEach(recipes) { item in
                    ResourcesBookView(recipe: item)
                      .frame(width: 120, height: 220)
                      .environment(\.colorScheme, .dark)

                  }
              })
              }

              HStack(alignment: .top, spacing: 0) {
                  Text("Cyberbullying")
                      .font(.title)
                      .fontWeight(.medium)
                      .foregroundColor(Color("ColorGreenAdaptive"))
                      .multilineTextAlignment(.leading)
                      .padding(.top)

              }
              
              ScrollView(.horizontal, showsIndicators: false) {
                  HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
                      
                  ForEach(recipes) { item in
                    ResourcesBookView(recipe: item)
                      .frame(width: 120, height: 220)
                      .environment(\.colorScheme, .dark)

                  }
              })
              }

              
              HStack(alignment: .top, spacing: 0) {
                  Text("Body Dysmporphia")
                      .font(.title)
                      .fontWeight(.medium)
                      .foregroundColor(Color("ColorGreenAdaptive"))
                      .multilineTextAlignment(.leading)
                      .padding(.top)

              }
              
              ScrollView(.horizontal, showsIndicators: false) {
                  HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
                      
                  ForEach(recipes) { item in
                    ResourcesBookView(recipe: item)
                      .frame(width: 120, height: 220)
                      .environment(\.colorScheme, .dark)

                  }
              })
              }
              
          }
          .frame(maxWidth: 640)
          .padding([.top, .leading, .trailing])
          
          // MARK: - FOOTER
          
          VStack(alignment: .center, spacing: 20) {
            Text("Resources")
              .fontWeight(.bold)
              .modifier(Goals_TitleModifier())
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

  struct Goals_TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
      content
        .font(.system(.title, design: .serif))
        .foregroundColor(Color("ColorGreenAdaptive"))
        .padding(8)
    }
  }

  struct ResourcesView_Previews2: PreviewProvider {
    static var previews: some View {
//      Group {
        ResourcesView()
//      }
    }
  }
