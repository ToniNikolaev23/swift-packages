//
//  SwiftfulUIBootcamp.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Toni Stoyanov on 19.01.25.
//

import SwiftUI
import SwiftfulUI

struct SomeItem: Identifiable {
    let id = UUID().uuidString
    let color = Color.red
}

struct SwiftfulUIBootcamp: View {
    @State private var isActive: Bool = false
    @State private var items: [SomeItem] = [SomeItem(), SomeItem(), SomeItem(), SomeItem()]
    var body: some View {
        
//        NonLazyVGrid(columns: 3,alignment: .leading, spacing: 16,  items: items) { item in
//            if let item {
//                item.color
//                    .frame(height: 50)
//            }
//        }
//        .padding(40)
        
        CustomProgressBar(selection: 50, range: 0...100, backgroundColor: .green, foregroundColor: .red, cornerRadius: 10, height: 50)
            .padding(40)
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .padding()
//            .frame(maxWidth: .infinity)
//            .padding(.vertical)
//            .withBackgroundAndBorder(backgroundColor: .white, borderColor: .blue, borderWidth: 2, cornerRadius: 32)
//            .padding()
//            .withGradientBackgroundAnimatable(isActive: isActive, activeGradient: LinearGradient(colors: [Color.red,.blue], startPoint: .leading, endPoint: .trailing), defaultGradient: LinearGradient(colors: [Color.green, .orange], startPoint: .leading, endPoint: .trailing), cornerRadius: 10)
//            .withDragGesture(
//                [.horizontal, .vertical],
//                minimumDistance: 0,
//                resets: false,
//                onChanged: { dragOffset in
//                    
//                },
//                onEnded: { dragOffset in
//                    
//                }
//            )
//            .asButton(.tap, action: {
//                withAnimation {
//                    isActive.toggle()
//                }
//            })
//            .readingFrame { frame in
//                <#code#>
//            }
    }
}

#Preview {
    SwiftfulUIBootcamp()
}
