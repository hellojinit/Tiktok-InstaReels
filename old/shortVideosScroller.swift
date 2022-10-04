//
//  ShortVideoScroller.swift
//  ReneeApp
//
//  Created by jinit shah on 8/8/21.
//

import SwiftUI
import AVKit

struct shortVideosScroller: View {
    /*let colors: [Color] = [
        .red, .green, .blue, .gray
    ]*/
    @State var data = [
        Video(id: 0, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video1", ofType: "mp4")!)), replay: false),
        Video(id: 1, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video2", ofType: "mp4")!)), replay: false),
        Video(id: 2, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video3", ofType: "mp4")!)), replay: false),
        Video(id: 3, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video4", ofType: "mp4")!)), replay: false),
        Video(id: 4, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video5", ofType: "mp4")!)), replay: false),
        Video(id: 5, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video6", ofType: "mp4")!)), replay: false),
        Video(id: 6, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "test1", ofType: "MOV")!)), replay: false),
        Video(id: 7, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "test2", ofType: "MOV")!)), replay: false),
        Video(id: 8, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "test3", ofType: "MOV")!)), replay: false)
    ]
    
    @State var currentIndex = 0
    @State var startOffset: CGPoint = .zero
    @State var offset: CGPoint = .zero
    
    var body: some View {
        GeometryReader { proxy in
                    UIScrollViewWrapper {
                        LazyVStack (spacing: 0){
                            ForEach(0 ..< self.data.count) { index in
                                ZStack {
                                    Player(player: data[currentIndex].player)
                                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                                        .offset(y: -5)
                                     /*   .onChange(of: offset.y, perform: { i in
                                            let rect = proxy .frame(in: .global)
                                            if startOffset == .zero {
                                                DispatchQueue.main.async {
                                                    startOffset = CGPoint(x: 0, y: rect.minY)
                                                }
                                            }
                                            DispatchQueue.main.async {
                                                self.offset = CGPoint(x: 0, y: startOffset.y - rect.minY)
                                            }
                                            currentIndex = Int(offset.y/UIScreen.main.bounds.height)
                                        
                                            if currentIndex != 0 {
                                                data[currentIndex-1].player.pause()
                                                if currentIndex + 1 != data.count {
                                                    data[currentIndex+1].player.pause()
                                                }
                                            }
                                            data[currentIndex].player.volume = 1
                                            data[currentIndex].player.seek(to: .zero)
                                            data[currentIndex].player.play()
                                            
                                            data[currentIndex].player.actionAtItemEnd = .none
                                            print(currentIndex)
                                            
                                            NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: data[currentIndex].player.currentItem, queue: .main) { _ in
                                                self.data[currentIndex].player.seek(to: .zero)
                                                self.data[currentIndex].player.play()
                                            }
                                        })*/
                                    
                                        .onAppear {
                                          //  currentIndex = index
                                          /*  if currentIndex != 0 {
                                                data[currentIndex-1].player.pause()
                                                if currentIndex + 1 != data.count {
                                                    data[currentIndex+1].player.pause()
                                                }
                                            }*/
                                            data[index].player.volume = 1
                                            data[index].player.seek(to: .zero)
                                            data[index].player.play()
                                            
                                            data[index].player.actionAtItemEnd = .none
                                            print(index)
                                            
                                            NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: data[index].player.currentItem, queue: .main) { _ in
                                                self.data[index].player.seek(to: .zero)
                                                self.data[index].player.play()
                                            }
                                          //  print(offset.y)
                                           // print(Int(offset.y/UIScreen.main.bounds.height))
                                        }
                                       /* .onChange(of: proxy.frame(in: .local).midY) { newValue in
                                            currentIndex = Int(offset.y/UIScreen.main.bounds.height)
                                            print(currentIndex)
                                        }*/
                                    
                                    ShortVideoCellView()
                                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                                    
                                    VStack {
                                        GeometryReader { proxy2 -> Text in
                                            let rect = proxy2.frame(in: .global)
                                            if startOffset == .zero {
                                                DispatchQueue.main.async {
                                                    startOffset = CGPoint(x: 0, y: rect.minY)
                                                }
                                            }
                                            DispatchQueue.main.async {
                                                self.offset = CGPoint(x: 0, y: startOffset.y - rect.minY)
                                            }
                                            currentIndex = Int(offset.y/UIScreen.main.bounds.height)
                                            print("y: \(offset.y)")
                                            print(currentIndex)

                                            return Text("")
                                        }
                                    }
                                    
                                    
                                }
                              /*  .onChange(of: proxy.frame(in: .global).midY) { newValue in
                                    let rect = proxy.frame(in: .global)
                                    if startOffset == .zero {
                                        DispatchQueue.main.async {
                                            startOffset = CGPoint(x: 0, y: rect.midY)
                                        }
                                    }
                                    DispatchQueue.main.async {
                                        self.offset = CGPoint(x: 0, y: startOffset.y - rect.midY)
                                    }
                                    print("y: \(offset.y)")
                                }*/
                            }
                        }
                   }
                }
        .edgesIgnoringSafeArea(.all)
    }
}


class UIScrollViewViewController: UIViewController {

    lazy var scrollView: UIScrollView = {
        let v = UIScrollView()
        v.isPagingEnabled = true
        v.showsVerticalScrollIndicator = false
        return v
    }()

    var hostingController: UIHostingController<AnyView> = UIHostingController(rootView: AnyView(EmptyView()))

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.scrollView)
        self.pinEdges(of: self.scrollView, to: self.view)

        self.hostingController.willMove(toParent: self)
        self.scrollView.addSubview(self.hostingController.view)
        self.pinEdges(of: self.hostingController.view, to: self.scrollView)
        self.hostingController.didMove(toParent: self)

    }

    func pinEdges(of viewA: UIView, to viewB: UIView) {
        viewA.translatesAutoresizingMaskIntoConstraints = false
        viewB.addConstraints([
            viewA.leadingAnchor.constraint(equalTo: viewB.leadingAnchor),
            viewA.trailingAnchor.constraint(equalTo: viewB.trailingAnchor),
            viewA.topAnchor.constraint(equalTo: viewB.topAnchor),
            viewA.bottomAnchor.constraint(equalTo: viewB.bottomAnchor),
        ])
    }

}

struct UIScrollViewWrapper<Content: View>: UIViewControllerRepresentable {

    var content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    func makeUIViewController(context: Context) -> UIScrollViewViewController {
        let vc = UIScrollViewViewController()
        vc.hostingController.rootView = AnyView(self.content())
        return vc
    }

    func updateUIViewController(_ viewController: UIScrollViewViewController, context: Context) {
        viewController.hostingController.rootView = AnyView(self.content())
    }
}
