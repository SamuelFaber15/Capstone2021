// Resources View (can include a link to a website)

//  ResourcesView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 3/2/21.
//

import SwiftUI

struct ResourcesView: View {
    // MARK: - PROPERTIES

    var overall_resources: [Resources] = mentalHealthResources
    var d_resources: [Resources] = depressionResources
    var a_resources: [Resources] = anxietyResources
    var cb_resources: [Resources] = cyberbullyingResources
    var bd_resources: [Resources] = bodyDysmorphiaResources

    var body: some View {
      
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center, spacing: 15) {
          // MARK: - HEADER

            HStack(alignment: .top, spacing: 10) {
            Text("Resources")
              .font(.system(.title, design: .serif))
              .fontWeight(.bold)
              .foregroundColor(Color("ColorGreenMedium"))
          }

          VStack(alignment: .center, spacing: 5) {
            Text("Here are a few resources that we have found to be helpful for various challenges that we all might face. Click on each to see a short summary")
                .font(.system(.body, design: .serif))
                .foregroundColor(Color.gray)
                .italic()
                .padding([.leading, .bottom, .trailing])
                .fixedSize(horizontal: false, vertical: true)

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
                      
                  ForEach(overall_resources) { item in
                    MentalHealthBookView(resource: item)
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
                      
                  ForEach(d_resources) { item in
                    MentalHealthBookView(resource: item)
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
                      
                  ForEach(a_resources) { item in
                    MentalHealthBookView(resource: item)
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
                      
                  ForEach(cb_resources) { item in
                    MentalHealthBookView(resource: item)
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
                      
                  ForEach(bd_resources) { item in
                    MentalHealthBookView(resource: item)
                      .frame(width: 120, height: 220)
                      .environment(\.colorScheme, .dark)

                  }
              })
              }
              
          }
          .frame(maxWidth: 640)
          .padding([.top, .leading, .trailing])
          .padding(.bottom, 85)

          
          // MARK: - FOOTER
          
//          VStack(alignment: .center, spacing: 20) {
//            Text("Resources")
//              .fontWeight(.bold)
//              .modifier(Resource_TitleModifier())
//            Text("You are enough - always.")
//              .font(.system(.body, design: .serif))
//              .multilineTextAlignment(.center)
//              .foregroundColor(Color.gray)
//              .frame(minHeight: 60)
//          }
//          .frame(maxWidth: 640)
//          .padding()
//          .padding(.bottom, 85)
        }
      }
//      .edgesIgnoringSafeArea(.all)
//      .padding(0)
    }
  }

  struct Resource_TitleModifier: ViewModifier {
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

