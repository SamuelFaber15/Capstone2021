//
//  InsightsListDetailView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 3/22/21.
//

import SwiftUI

struct InsightsListDetailView: View {
    // MARK: - PROPERTIES
    
    var insight: Insight
    
    @State private var pulsate: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
      ScrollView(.vertical, showsIndicators: false) {
          let dateText = insight.title.replacingOccurrences(of: "@Date", with: userInfo.user.scoreDate)
        VStack(alignment: .center, spacing: 0) {
          // IMAGE
          Image(insight.image)
            .resizable()
            .scaledToFit()
          
          Group {
            // TITLE
            Text(dateText)
              .font(.title)
              .fontWeight(.semibold)
              .multilineTextAlignment(.center)
              .foregroundColor(Color("ColorGreenAdaptive"))
              .padding(.top, 10)
            
              Text("Insights")
                  .font(.largeTitle)
              .fontWeight(.ultraLight)
              .modifier(TitleModifier())
            
            VStack(alignment: .leading, spacing: 5) {
              ForEach(insight.content, id: \.self) { item in
                let contentText = item.replacingOccurrences(of: "@User", with: userInfo.user.name)
                VStack(alignment: .leading, spacing: 5) {
                  Text(contentText)
                    .font(.footnote)
                      .fontWeight(.thin)
                      .multilineTextAlignment(.center)
                      .padding([.leading, .bottom, .trailing])
                    .fixedSize(horizontal: false, vertical: true)
  //                Divider()
                }
              }
            }
            
            // INSTRUCTIONS
              Image("leaf")
                  .padding(.all)
                  
              Text("What Now?")
                  .font(.largeTitle)
              .fontWeight(.ultraLight)
              .modifier(TitleModifier())
            
            ForEach(insight.tips, id: \.self) { item in
            let tipsText = item.replacingOccurrences(of: "@User", with: userInfo.user.name)
              VStack(alignment: .center, spacing: 5) {
                Image(systemName: "chevron.down.circle")
                  .resizable()
                  .frame(width: 42, height: 42, alignment: .center)
                  .imageScale(.large)
                  .font(Font.title.weight(.ultraLight))
                  .foregroundColor(Color("ColorGreenAdaptive"))
                
                  Text(tipsText)
                      .fontWeight(.thin)
                  .lineLimit(nil)
                  .multilineTextAlignment(.center)
                      .font(.body)
                  .frame(minHeight: 100)
                    .fixedSize(horizontal: false, vertical: true)
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

  struct InsightsListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsListDetailView(insight: insightsData[0])
    }
  }
