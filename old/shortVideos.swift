//
//  shortVideos.swift
//  shortVideos
//
//  Created by jinit shah on 10/5/21.
//

import SwiftUI

struct shortVideos: View {
    @State var sv = false
    var body: some View {
      
        
        Text("Click to view short videos")
            .onTapGesture {
                sv = true
            }
    }
}

struct shortVideos_Previews: PreviewProvider {
    static var previews: some View {
        shortVideos()
    }
}
