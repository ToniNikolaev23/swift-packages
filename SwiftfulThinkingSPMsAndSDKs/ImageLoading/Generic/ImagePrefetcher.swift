//
//  ImagePrefetcher.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Toni Stoyanov on 18.01.25.
//

import Foundation
import SDWebImageSwiftUI

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

import Kingfisher
final class ImagePrefetcher2 {
    static let instance = ImagePrefetcher2()
    
    var prefetcher: [[URL] : Kingfisher.ImagePrefetcher] = [:]
    
    private init() {}
    
    func startPrefetching(urls: [URL]) {
        prefetcher[urls] = Kingfisher.ImagePrefetcher(urls: urls)
        prefetcher[urls]?.start()
    }
    
    func stopPrefetching(urls: [URL]) {
        prefetcher[urls]?.stop()
    }
}
