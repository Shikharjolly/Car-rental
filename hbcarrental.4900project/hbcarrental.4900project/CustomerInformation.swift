//  CustomerInformation.swift
//  hbcarrental.4900project

import Foundation

struct User: Codable {
    var firstName: String
    var lastName: String
    var emailAddress: String
    var password: String
}

class CustomerInformation {
    static let shared = CustomerInformation()
    
    private(set) var users: [User] = []
    
    private init() {
        let user = User(firstName: "Ayrat", lastName: "Aymetov", emailAddress: "brooklyn@gmail.com", password: "1234")
        users.append(user)
    }
    
    func addUser(user: User) {
        users.append(user)
        saveUsers()
    }
    
    private func saveUsers() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(users) {
            UserDefaults.standard.set(encoded, forKey: "SavedUsers")
        }
    }
    
    func loadUsers() {
        if let savedUsers = UserDefaults.standard.object(forKey: "SavedUsers") as? Data {
            let decoder = JSONDecoder()
            if let loadedUsers = try? decoder.decode([User].self, from: savedUsers) {
                users = loadedUsers
            }
        }
    }

    func userExists(emailAddress: String, password: String) -> Bool {
        return users.contains { $0.emailAddress == emailAddress && $0.password == password }
    }
}