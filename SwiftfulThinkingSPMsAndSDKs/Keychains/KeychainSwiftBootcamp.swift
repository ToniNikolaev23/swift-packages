//
//  KeychainSwiftBootcamp.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Toni Stoyanov on 18.01.25.
//

import SwiftUI
import KeychainSwift

final class KeychainManager {
    private let keychain: KeychainSwift
    
    init() {
        let keychain = KeychainSwift()
        keychain.synchronizable = true
        self.keychain = keychain
    }
    
    func set(_ value: String, key: String) {
        keychain.set(value, forKey: key)
    }
    
    func get(key: String) -> String? {
        keychain.get(key)
    }
}

struct KeychainManagerKey: EnvironmentKey {
    static let defaultValue: KeychainManager = KeychainManager()
}

extension EnvironmentValues {
    var keychain: KeychainManager {
        get { self[KeychainManagerKey.self] }
        set { self[KeychainManagerKey.self] = newValue }
    }
}

@propertyWrapper
struct KeychainStorage: DynamicProperty {
    @State private var newValue: String
    let key: String
    let keychain: KeychainManager
    
    var wrappedValue: String {
        get {
            newValue
        }
        nonmutating set {
            save(newValue: newValue)
        }
    }
    
    var projectedValue: Binding<String> {
        Binding(get: {
            wrappedValue
        }, set: { newValue in
            wrappedValue = newValue
        })
    }
    
    init(wrappedValue: String, _ key: String) {
        self.key = key
        
       let keychain = KeychainManager()
        self.keychain = keychain
        
        newValue = keychain.get(key: key) ?? ""
        
    }
    
    func save(newValue: String) {
        keychain.set(newValue, key: key)
        self.newValue = newValue
    }
}


struct KeychainSwiftBootcamp: View {
    
//    @Environment(\.keychain) var keychain
//    @State private var userPassword: String = ""
    @KeychainStorage("user_password") var userPassword: String = ""
    var body: some View {
        Button(action: {
            let newPassword = "test123"
//            keychain.set(newPassword, key: "user_password")
            userPassword = newPassword
        }, label: {
            Text(userPassword.isEmpty ? "No password" : userPassword)
        })
//        .onAppear {
//            userPassword = keychain.get(key: "user_password") ?? ""
//        }
    }
}

#Preview {
    KeychainSwiftBootcamp()
}
