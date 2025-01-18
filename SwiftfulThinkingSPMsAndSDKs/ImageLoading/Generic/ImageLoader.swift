//
//  ImageLoader.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Toni Stoyanov on 18.01.25.
//

import SwiftUI

struct ImageLoader: View {
    let url: String
    var contentMode: ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay(
//                SDWebImageLoader(url: url, contentMode: contentMode)
                KingfisherImageLoader(url: url, contentMode: contentMode)
                    .allowsHitTesting(false)
            )
            .clipped()

    }
}

#Preview {
    ImageLoader(url: "https://picsum.photos/id/237/200/300", contentMode: .fill)
        .frame(width: 200, height: 200)
}
