//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Данис Гаязов on 17.10.24..
//

import Foundation
import SwiftUI

final class StorageManager {
    static let shared = StorageManager()
    
    @AppStorage("user") private var userData: Data?
    
    private init() {}
    
    func save(user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    func fetchUser() -> User {
        guard let userData else { return User() }
        let user = try? JSONDecoder().decode(User.self, from: userData)
        return user ?? User()
    }
    
    func clear() {
        userData = nil
    }
}
