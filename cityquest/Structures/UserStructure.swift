//
//  UserStructure.swift
//  cityquest
//
//  Created by Fernand LIME on 24/10/2024.
//
import SwiftUI
import SwiftData

@Model
class User {
    @Attribute(.unique) var id: UUID
    var firstname: String
    var lastname: String
    var username: String
    var email: String
    var avatarData: Data?
    var history: [String: [String]] = [:]




    init(firstname: String, lastname: String, username: String, email: String, avatar: Image = Image(systemName: "person.crop.circle")) {
        self.id = UUID()
        self.firstname = firstname
        self.lastname = lastname
        self.username = username
        self.email = email
    }
}

extension User {
    func isVisited(idCity : String?, idMonument: String) -> Bool {

        if let city = idCity {
        
            guard let history = history[city] else {
                return false
            }
            return history.contains(idMonument)
        }
        else {
            return false
        }

    }
    

    func addVisit(cityName: String, monumentName: String) {
        if history.keys.contains(cityName){
            history[cityName]?.append(monumentName)
        }
        else {
            history[cityName] = [monumentName]
        }

    }
}
