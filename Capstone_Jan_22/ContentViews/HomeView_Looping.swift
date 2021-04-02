//
//  HomePage_Looping.swift
//  Capstone_Jan_22
//
//  Created by Ashleigh Koener on 3/30/21.
//

import SwiftUI
import AVFoundation



struct HomeView_Looping: UIViewRepresentable {
    
    @EnvironmentObject var userInfo: UserInfo
    func makeUIView(context: Context) -> UIView {
        return QueuePlayerUIView(frame: .zero)
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // Do nothing here
    }
}


class QueuePlayerUIView: UIView {
    
    
//    @State private var pulsateAnimation: Bool = false
//    @State var show = false
//    var body: some View {
////        NavigationView{
//            NavigationLink(destination: AppView(), isActive: $show, label: {
//                VStack {
//                  Spacer()
//
//                  Image("welcome")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 300, height: 300, alignment: .center)
//                    .shadow(color: Color("ColorBlackTransparentDark"), radius: 12, x: 0, y: 8)
//                    .scaleEffect(self.pulsateAnimation ? 1 : 1.2)
//                    .opacity(self.pulsateAnimation ? 1 : 0.9)
//////                    .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
////
//                  Spacer()
//                }
//                .background(
//                  Image("background")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                )
//                  .edgesIgnoringSafeArea(.all)
//                  .onAppear(perform: {
//                    self.pulsateAnimation.toggle()
//                  })
//            })
//                .onAppear {
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
//                        self.show.toggle()
//                    }
//            }
//        }
//    }

    
    
    
    
    
    
    
    
    
    
    
//    @State private var pulsateAnimation: Bool = false
//    @State var show = false

//    var body: some View {
//        NavigationView{
//            NavigationLink(destination: AppView(), isActive: $show, label: {
//                VStack {
//                  Spacer()
//
//                  Image("welcome")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 300, height: 300, alignment: .center)
//                    .shadow(color: Color("ColorBlackTransparentDark"), radius: 12, x: 0, y: 8)
//                    .scaleEffect(self.pulsateAnimation ? 1 : 1.2)
//                    .opacity(self.pulsateAnimation ? 1 : 0.9)
////                    .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
//
//                  Spacer()
//                }
//        }
//    )}
//
//}
    private var playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?

    override init(frame: CGRect) {
        super.init(frame: frame)

        // Load Video
        let fileUrl = Bundle.main.url(forResource: "Home_Background_Final", withExtension: "mov")!
        let playerItem = AVPlayerItem(url: fileUrl)

        // Setup Player
        let player = AVQueuePlayer(playerItem: playerItem)
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)

        // Loop
        playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)

        // Play
        player.play()
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class PlayerUIView: UIView {
    private var playerLayer = AVPlayerLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)

        // Load Video
        let fileUrl = Bundle.main.url(forResource: "Home_Background_Final", withExtension: "mov")!
        let playerItem = AVPlayerItem(url: fileUrl)

        // Setup Player
        let player = AVPlayer(playerItem: playerItem)
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)

        // Loop
        player.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(self, selector: #selector(rewindVideo(notification:)), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)

        // Play
        player.play()
        
        
        
    }

    @objc
    func rewindVideo(notification: Notification) {
        playerLayer.player?.seek(to: .zero)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
//        playerLayer.frame = bounds
        playerLayer.frame.size = self.sizeThatFits(bounds.size)

//
//        let pad: CGFloat = 0
//        var top: CGFloat = pad
//        playerLayer.frame = CGRect(x: pad, y: top, width: bounds.width - (pad * 2), height: 0)
//        top += playerLayer.bounds.height + pad

//        detailLabel.frame = CGRect(x: pad, y: top, width: bounds.width - (pad * 2), height: bounds.height - top)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    


}


struct HomeView_Looping_Previews: PreviewProvider {
    static var previews: some View {
        HomeView_Looping()
    }
}
