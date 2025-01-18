//
//  SDWebImageBootcamp.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Toni Stoyanov on 18.01.25.
//

import SwiftUI
import SDWebImageSwiftUI

// https://picsum.photos/id/237/200/300

struct ImageLoader: View {
    let url: String
    var contentMode: ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay(
                SDWebImageLoader(url: url, contentMode: contentMode)
                    .allowsHitTesting(false)
            )
            .clipped()

    }
}

fileprivate struct SDWebImageLoader: View {
    
    let url: String
    var contentMode: ContentMode = .fill
    
    var body: some View {
        WebImage(url: URL(string: url))
            .onSuccess(perform: { image, data, cacheType in
                
            })
            .onFailure(perform: { error in
                
            })
            .resizable()
            .aspectRatio(contentMode: contentMode)
            
    }
}

final class ImagePrefetcher {
    static let instance = ImagePrefetcher()
    
    private let prefetcher = SDWebImagePrefetcher()
    
    private init() {}
    
    func startPrefetching(urls: [URL]) {
        prefetcher.prefetchURLs(urls)
    }
    
    func stopPrefetching() {
        prefetcher.cancelPrefetching()
    }
}

struct SDWebImageBootcamp: View {
    var body: some View {
        ImageLoader(url: "https://picsum.photos/id/237/200/300", contentMode: .fill)
            .frame(width: 200, height: 200)
        
        
    }
}

#Preview {
    SDWebImageBootcamp()
}
