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
    @State var gameManager = GameManager()
    
    var body: some Scene {
        WindowGroup {
            FirstView()
                .environment(gameManager)
                .modelContainer(for : [User.self])
        }
    }
}
