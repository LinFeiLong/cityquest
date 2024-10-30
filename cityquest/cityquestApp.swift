//
//  cityquestApp.swift
//  cityquest
//
//  Created by Fernand LIME on 18/10/2024.
//

import SwiftUI
import SwiftData
@main
struct cityquestApp: App {
    var body: some Scene {
        WindowGroup {
            FirstView().modelContainer(for : User.self)
        }
    }
}
