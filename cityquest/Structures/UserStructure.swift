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




    init(firstname: String, lastname: String, username: String, email: String, avatar: Image = Image(systemName: "person.crop.circle")) {

        self.firstname = firstname
        self.lastname = lastname
        self.username = username
        self.email = email

    }



}

