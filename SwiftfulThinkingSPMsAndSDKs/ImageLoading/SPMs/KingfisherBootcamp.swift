//
//  KingfisherBootcamp.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Toni Stoyanov on 18.01.25.
//

import SwiftUI
import Kingfisher

struct KingfisherImageLoader: View {
    let url: String
    var contentMode: SwiftUI.ContentMode = .fill
    
    var body: some View {
        KFImage(URL(string: url))
            .placeholder {
                Color.red
            }
        .resizable()
        .onProgress({ receivedSize, totalSize in
            
        })
        .onSuccess({ result in
            
        })
        .onFailure({ error in
            
        })
        .cacheMemoryOnly()
//        .setProcessor(T##processor: any ImageProcessor##any ImageProcessor)
        .aspectRatio(contentMode: contentMode)
    }
}

#Preview {
    KingfisherImageLoader(url: "https://picsum.photos/id/237/200/300", contentMode: .fill)
        .frame(width: 200, height: 200)
}
