//
//  AsyncModel.swift
//  cityquest
//
//  Created by Bartos Nicolas on 06/11/2024.
//

import SwiftUI

struct GamePreviewWrapper<Content: View>: View {
    @State var gameManager: GameManager = GameManager()
    var viewBuilder: () -> Content
    
    var body: some View {
        Group {
            if (gameManager.currentGame.steps.isEmpty) {
                Text("Chargement...")
            } else {
                viewBuilder()
                    .environment(gameManager)
            }
        }
        .onAppear {
            Task {
                try await gameManager.getStepsFromJSON("marseille", 5, 5)
            }
        }
    }
}
