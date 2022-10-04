//
//  Video.swift
//  shortVideos
//
//  Created by jinit shah on 10/11/21.
//

import SwiftUI
import AVKit

struct Video: Identifiable {
    var id: Int
    var player: AVPlayer
    var replay: Bool
}
