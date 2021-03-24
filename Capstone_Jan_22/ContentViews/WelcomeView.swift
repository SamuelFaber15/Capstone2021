//
//  WelcomeView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 3/22/21.
//

import SwiftUI

struct WelcomeView: View {
    // MARK: - PROPERTIES
    
    @State private var pulsateAnimation: Bool = false
    @State var show = false
    var body: some View {
        NavigationView{
            NavigationLink(destination: AppView(), isActive: $show, label: {
                VStack {
                  Spacer()
                  
                  Image("welcome")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300, alignment: .center)
                    .shadow(color: Color("ColorBlackTransparentDark"), radius: 12, x: 0, y: 8)
                    .scaleEffect(self.pulsateAnimation ? 1 : 1.2)
                    .opacity(self.pulsateAnimation ? 1 : 0.9)
//                    .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                  
                  Spacer()
                }
                .background(
                  Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                )
                  .edgesIgnoringSafeArea(.all)
                  .onAppear(perform: {
                    self.pulsateAnimation.toggle()
                  })
            })
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        self.show.toggle()
                    }
            }
        }
    }
  }

  struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
        .previewDevice("iPhone 12 Pro")
        .environment(\.colorScheme, .light)
    }
  }
