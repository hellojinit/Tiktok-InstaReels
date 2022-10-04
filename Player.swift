//
//  Player.swift
//  shortVideos
//
//  Created by jinit shah on 10/11/21.
//

import SwiftUI
import AVKit

struct PlayerView: View {
    @State var didLike = false
    // var isFollowed: Bool { return viewModel.post.isFollowed ?? false}
  //  var color: Color
    @State var goToComments = false
    @State var modalIsShowing = false
    @State var showingActionSheet = false
    @State var goToSources = false
    @State var goToPost = false
    @State var isPaused = false
    @State var offsett: CGFloat = 0
    @State var showFullCaption = false
   // var postWidth: CGFloat
   // var forFeed: Bool
   // @Binding var dismiss: Bool
    let w = UIScreen.main.bounds.width
    @State var commentText: String = ""
    @State var commentHeight: CGFloat = 0
    @State var placeholder = "Comment..."
    
    @Binding var data: [Video]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0 ..< self.data.count) { index in
                    ZStack (alignment: .bottomTrailing) {
                        Player(player: data[index].player)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                            .offset(y: -5)
                        
                        if !isPaused {
                            HStack (alignment: .bottom){
                                VStack (alignment: .leading) {
                                    Spacer()
                                    HStack {
                                        Circle()
                                            .fill(Color.blue)
                                            .frame(width: 40, height: 40)
                                        Text("username")
                                            .font(.callout)
                                            .fontWeight(.semibold)
                                        Spacer()
                                    }
                                    
                                    Text("this is some random caption. blah blah blah askfa sk askd akd akd kd akd kad ka kakad k aakfksks adasda a aa svscvscxcavcvavrsgfg sdvsdv svwefsdfadsf sdcsgs sdsad aklsd as lads a la lka dlkas dlas dlas ld asld asd aslkdk asld lasdasl dlasm dlaskdlas la las dlsa dlas dla sldkasl dals dlas dlas dlas kdas dlas dlas lsa las las las las als asl dasld asd asl dals das dlas dlas ldas lask lsa dldas ldks la  dla sdlaks")
                                        .font(.system(.callout, design: .rounded))
                                        .lineLimit(showFullCaption ? nil : 2)
                                        .padding(.bottom, UIScreen.main.bounds.width*0.1)
                                        .onTapGesture {
                                            withAnimation {
                                                showFullCaption.toggle()
                                            }
                                        }
                                }.shadow(radius: 10)
                                
                                VStack (alignment: .trailing) {
                                    Button {
                                        goToSources = true
                                    } label: {
                                        Text("P")
                                            .font(.callout)
                                            .foregroundColor(.white)
                                            //.padding(w*0.025)
                                            .frame(width: UIScreen.main.bounds.width*0.08, height: UIScreen.main.bounds.width*0.08)
                                            .background(Color.green.opacity(0.9))
                                            .clipShape(Circle())
                                            .padding(.bottom, UIScreen.main.bounds.width*0.035)
                                    }
                                    
                                    Image(systemName: didLike ? "heart.fill" : "heart")
                                        .resizable()
                                        .scaledToFill()
                                        .foregroundColor(didLike ? .red : .white)
                                        .onTapGesture {
                                            didLike.toggle()
                                        }
                                        .frame(width: UIScreen.main.bounds.width*0.065, height: UIScreen.main.bounds.width*0.065)
                                    
                                    Text("54")
                                        .font(.system(.callout, design: .rounded))
                                        .fontWeight(.semibold)
                                        .padding(.bottom, w*0.035)
                                    
                                    Image(systemName: "text.bubble")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: w*0.065, height: w*0.065)
                                        .padding(.bottom, w*0.035)
                                        .onTapGesture {
                                            withAnimation {
                                               // modalIsShowing = true
                                                //goToComments = true
                                            }
                                        }
                                    
                                    Image(systemName: "paperplane")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: w*0.065, height: w*0.065)
                                        .padding(.bottom, w*0.05)
                                    
                                    
                                    Image(systemName: "multiply")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: w*0.05, height: w*0.05)
                                        .padding(.bottom, w*0.1)
                                            
                                }
                            }
                            .padding(.horizontal)
                            .foregroundColor(.white)
                            .shadow(radius: 20)
                        }
                    }
            }
        }
        .onAppear {
            self.data[0].player.play()
            self.data[0].player.actionAtItemEnd = .none
            NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.data[0].player.currentItem, queue: .main) { _ in
                self.data[0].player.seek(to: .zero)
                self.data[0].player.play()
            }
        }
    }
}

struct Player: UIViewControllerRepresentable {
    
    var player: AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let view = AVPlayerViewController()
        view.player = player
        view.showsPlaybackControls = false
        view.videoGravity = .resizeAspectFill
        return view
        
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}
