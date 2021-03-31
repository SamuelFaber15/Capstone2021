//
//  HeaderView.swift
//  Capstone_Jan_22
//
//  Created by Ashleigh Koener on 3/30/21.
//

import SwiftUI

struct HeaderView: View {
  // MARK: - PROPERTIES
  
  var header: Header
  
  @State private var showHeadline: Bool = false
  
  var slideInAnimation: Animation {
    Animation.spring(response: 1.5, dampingFraction: 0.5, blendDuration: 0.5)
      .speed(1)
      .delay(0.25)
  }
  
  var body: some View {
    ZStack {
      Image(header.image)
        .resizable()
        .aspectRatio(contentMode: .fill)
      
        HStack(alignment: .top, spacing: 0) {
        Rectangle()
          .fill(Color("ColorBlueMedium"))
          .frame(width: 5)
        
        VStack(alignment: .leading, spacing: 6) {
          Text(header.headline)
            .font(.system(size: 12, weight: .bold, design: .serif))
            .foregroundColor(Color.white)
            .shadow(radius: 2)
          
          Text(header.subheadline)
            .font(.system(size: 10, weight: .bold, design: .rounded))
            .lineLimit(4)
            .multilineTextAlignment(.leading)
            .foregroundColor(Color.white)
            .shadow(radius: 2)
        }
        .padding(.vertical, 0)
        .padding(.horizontal, 5)
        .frame(width: 281, height: 95).ignoresSafeArea()
        .background(Color("ColorBlueTransparentLight"))
      }
      .frame(width: 285, height: 95, alignment: .center)
      .offset(x: -10, y: showHeadline ? 28 : 120).ignoresSafeArea()
      .animation(slideInAnimation)
      .onAppear(perform: {
        showHeadline = true
      })
      .onDisappear(perform: {
        showHeadline = false
      })
    }
    .frame(width: 480, height: 190, alignment: .center).ignoresSafeArea()
  }
}

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView(header: headersData[1])
      .previewLayout(.sizeThatFits)
      .environment(\.colorScheme, .dark)
  }
}
