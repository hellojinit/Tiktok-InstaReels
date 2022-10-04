//
//  Home.swift
//  shortVideos
//
//  Created by jinit shah on 10/11/21.
//

import SwiftUI
import AVKit

struct Home: View {
    
    @State var index = 0
    @State var top = 0
    @State var data = [
        Video(id: 0, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video4", ofType: "mp4")!)), replay: false),
        Video(id: 1, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video5", ofType: "mp4")!)), replay: false),
        Video(id: 2, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video2", ofType: "mp4")!)), replay: false),
        Video(id: 3, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video3", ofType: "mp4")!)), replay: false),
        Video(id: 4, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video1", ofType: "mp4")!)), replay: false),
        Video(id: 5, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video6", ofType: "mp4")!)), replay: false),
        Video(id: 6, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "test1", ofType: "MOV")!)), replay: false),
        Video(id: 7, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "test2", ofType: "MOV")!)), replay: false),
        Video(id: 8, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "test3", ofType: "MOV")!)), replay: false),
        Video(id: 9, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "test4", ofType: "MOV")!)), replay: false)
    ]
    
    var body: some View {
        ZStack {
            
            PlayerScrollView(data: $data)
            /*
            VStack{
                
                Spacer()
                //right menu
                HStack{
                    Spacer()
                    VStack(spacing: 35){
                        
                        Button(action: {
                            
                        }, label: {
                            VStack {
                                Image(systemName: "suit.heart.fill")
                                    .font(.title)
                                    .foregroundColor(.white)
                                Text("400K")
                                    .foregroundColor(.white)
                            }
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            VStack(spacing: 8) {
                                Image(systemName: "message.fill")
                                    .font(.title)
                                    .foregroundColor(.white)
                                Text("1542")
                                    .foregroundColor(.white)
                            }
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            VStack{
                                Image(systemName: "arrowshape.turn.up.right.fill")
                                    .font(.title)
                                    .foregroundColor(.white)
                                Text("Share")
                                    .foregroundColor(.white)
                            }
                        })
                    }
                    .padding(.bottom, 55)
                    .padding(.trailing)
                }
            }
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 5)*/
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }
}
