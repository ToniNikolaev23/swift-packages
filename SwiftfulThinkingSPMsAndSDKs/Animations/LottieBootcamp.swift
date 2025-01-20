//
//  LottieBootcamp.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Toni Stoyanov on 20.01.25.
//

import SwiftUI
import Lottie

struct LottieHelperView: View {
    var fileName: String = "StarAnimation"
    var contentMode: UIView.ContentMode = .scaleAspectFit
    var playLoopMode: LottieLoopMode = .playOnce
    var onAnimationDidFinish: (() -> Void)? = nil
    
    var body: some View {
        LottieView(animation: .named(fileName))
            .configure({ lottieAnimationView in
                lottieAnimationView.contentMode = contentMode
            })
            .playbackMode(.playing(.toProgress(1, loopMode: playLoopMode)))
            .animationDidFinish { completed in
                onAnimationDidFinish?()
            }
    }
}

#Preview {
    LottieHelperView()
}
