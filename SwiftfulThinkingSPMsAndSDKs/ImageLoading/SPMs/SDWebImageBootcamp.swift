//
//  SDWebImageBootcamp.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Toni Stoyanov on 18.01.25.
//

import SwiftUI
import SDWebImageSwiftUI

// https://picsum.photos/id/237/200/300



struct SDWebImageLoader: View {
    
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



struct SDWebImageBootcamp: View {
    var body: some View {
        ImageLoader(url: "https://picsum.photos/id/237/200/300", contentMode: .fill)
            .frame(width: 200, height: 200)
        
        
    }
}

#Preview {
    SDWebImageBootcamp()
}
