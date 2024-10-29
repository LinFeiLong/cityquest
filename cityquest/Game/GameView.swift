//
//  GameView.swift
//  cityquest
//
//  Created by Bartos Nicolas on 24/10/2024.
//

import SwiftUI

struct GameView: View {
    @State var selectedMonument: Monument = monuments.first! //Pas bien
    @State var isOnDestination: Bool = true
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            GameMapView(selectedMonument: $selectedMonument)
            if isOnDestination {
                GameQuestionsView(monument: selectedMonument)
            } else {
                GameTabNav(selectedMonument: $selectedMonument)
                    .padding(.trailing, 25)
                    .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    GameView(isOnDestination: false)
}
