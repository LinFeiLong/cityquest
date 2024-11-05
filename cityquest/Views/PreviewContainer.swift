//
//  PreviewCotainerSwiftData.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 04/11/2024.
//

import Foundation

import SwiftData

struct PreviewContainer {
    @MainActor
    static var mc: ModelContainer = {
        return try! inMemoryContainer()
    }()

    static var inMemoryContainer: () throws -> ModelContainer = {
        let schema = Schema([User.self])
        let container = try ModelContainer(for: schema, configurations: [ModelConfiguration(isStoredInMemoryOnly: true)])
        Task { @MainActor in
            var user = User(firstname: "Marcos", lastname: "Pulcos", username: "MarcosPulcos", email: "marco@gmail.com")
            user.history = ["UUID-1": ["sfj","sjf"], "UUID-2": ["sjf","sjf","sjf"]]
            container.mainContext.insert(user)

        }
        return container
    }
}
