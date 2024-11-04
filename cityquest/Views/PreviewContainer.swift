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

            container.mainContext.insert(User(firstname: "Marcos", lastname: "Pulcos", username: "MarcosPulcos", email: "marco@gmail.com")  )

        }
        return container
    }
}
