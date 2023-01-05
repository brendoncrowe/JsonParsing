//
//  UserModel.swift
//  JsonParsing
//
//  Created by Brendon Crowe on 1/4/23.
//

import Foundation

struct UserData: Codable {
    var results: [User]
}

struct User: Codable {
    struct Name: Codable {
        let first: String
        let last: String
    }
    struct Age: Codable {
        let age: Int
    }
    let name: Name
    let dob: Age
    let gender: String
    let email: String
}


extension UserData {
    
    static func getUsers() -> [User] {
        var users = [User]()
        
        guard let pathToData = Bundle.main.url(forResource: "users", withExtension: "json") else { fatalError("could not find user.json") }
        do {
            let data = try Data(contentsOf: pathToData)
            let usersData = try JSONDecoder().decode(UserData.self, from: data)
            users = usersData.results
        } catch {
            fatalError("failed to load content \(error)")
        }
        return users
    }
}
