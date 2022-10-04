//
//  PlayerScrollView.swift
//  shortVideos
//
//  Created by jinit shah on 10/11/21.
//

import SwiftUI
import UIKit

struct PlayerScrollView: UIViewRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return PlayerScrollView.Coordinator(view: self)
    }
    
    
    @Binding var data: [Video]
    
    func makeUIView(context: Context) -> UIScrollView {
        let view = UIScrollView()
        
        let childView = UIHostingController(rootView: PlayerView(data: self.$data))
        childView.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat(data.count))
        
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat(data.count))
        
        view.addSubview(childView.view)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.contentInsetAdjustmentBehavior = .never
        view.isPagingEnabled = true
        view.delegate = context.coordinator
        
        return view
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        uiView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat(data.count))
        
        for i in 0..<uiView.subviews.count {
            uiView.subviews[i].frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat(data.count))
        }
        
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        var view: PlayerScrollView
        
        init(view: PlayerScrollView) {
            self.view = view
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            
            let currentIndex = Int(scrollView.contentOffset.y / UIScreen.main.bounds.height)
            
            var index = 0
            
            if currentIndex != index {
                index = currentIndex
                if index != 0 {
                    view.data[index-1].player.pause()
                    if index + 1 != view.data.count {
                        view.data[index+1].player.pause()
                    }
                }
                view.data[index].player.volume = 1
                view.data[index].player.seek(to: .zero)
                view.data[index].player.play()
                
                view.data[index].player.actionAtItemEnd = .none
                
                NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: view.data[index].player.currentItem, queue: .main) { _ in
                    self.view.data[index].player.seek(to: .zero)
                    self.view.data[index].player.play()
                }
                
            }
            
            
        }
    }
    
}

class HeartButton: UIButton {
  private var isLiked = false
  
  private let unlikedImage = UIImage(systemName: "heart")
  private let likedImage = UIImage(systemName: "heart.fill")
  
  private let unlikedScale: CGFloat = 0.7
  private let likedScale: CGFloat = 1.3

  override public init(frame: CGRect) {
    super.init(frame: frame)

    setImage(unlikedImage, for: .normal)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public func flipLikedState() {
    isLiked = !isLiked
    animate()
  }

  private func animate() {
    UIView.animate(withDuration: 0.1, animations: {
      let newImage = self.isLiked ? self.likedImage : self.unlikedImage
      let newScale = self.isLiked ? self.likedScale : self.unlikedScale
      self.transform = self.transform.scaledBy(x: newScale, y: newScale)
      self.setImage(newImage, for: .normal)
    }, completion: { _ in
      UIView.animate(withDuration: 0.1, animations: {
        self.transform = CGAffineTransform.identity
      })
    })
  }
}
