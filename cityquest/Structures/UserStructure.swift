//
//  UserStructure.swift
//  cityquest
//
//  Created by Fernand LIME on 24/10/2024.
//
import SwiftUI
import SwiftData

@Model class User {
    var id = UUID()
    var firstname: String
    var lastname: String
    var username: String
    var email: String
    var avatarData: Data?
    var history: [String: [String]] = [:]




    init(firstname: String, lastname: String, username: String, email: String, avatar: Image = Image(systemName: "person.crop.circle")) {

        self.firstname = firstname
        self.lastname = lastname
        self.username = username
        self.email = email

    }



}


extension User {

    func isVisited(idCity : String?, idMonument: String) -> Bool {
        guard let monumentsIDVisited = history[idCity ?? ""] else {
            return false
        }
        return monumentsIDVisited.contains(idMonument)

    }

}
