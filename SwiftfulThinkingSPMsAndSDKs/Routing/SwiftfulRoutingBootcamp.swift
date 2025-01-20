//
//  SwiftfulRoutingBootcamp.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Toni Stoyanov on 20.01.25.
//

import SwiftUI
import SwiftfulRouting

struct SwiftfulRoutingBootcamp: View {
    var body: some View {
        RouterView { router in
//            Text("View 1")
//                .onTapGesture {
//                    router.showScreen(.push) { router2 in
//                        Text("View 2")
//                            .onTapGesture {
//                                router2.showScreen(.push) { router3 in
//                                    Text("View 3")
//                                        .onTapGesture {
//                                            router3.showScreen(.push) { router4 in
//                                                Text("View 4")
//                                            }
//                                        }
//                                }
//                            }
//                    }
//                }
            MyHomeView(viewModel: MyHomeViewModel(router: router))
        }
       
    }
}

final class MyHomeViewModel: ObservableObject {
    let router: AnyRouter
    
    init(router: AnyRouter) {
        self.router = router
    }
    
    func goToNextScreen() {
        router.showScreen(.push) { router in
            MyThirdScreen(router: router)
        }
    }
}

struct MyHomeView: View {
//    let routerView: AnyRouter
//    @Environment(\.router) var router
    
    @StateObject var viewModel: MyHomeViewModel
    var body: some View {
        Button(action: {
            viewModel.goToNextScreen()
        }, label: {
            Text("Click me")
        })
        .navigationTitle("Home")
    }
}

struct MyThirdScreen: View {
    let router: AnyRouter
//    @Environment(\.router) var router
    var body: some View {
        Button(action: {
            router.dismissScreen()
        }, label: {
            Text("Click me")
        })
        .navigationTitle("Screen 3")
    }
}

#Preview {
    SwiftfulRoutingBootcamp()
}
