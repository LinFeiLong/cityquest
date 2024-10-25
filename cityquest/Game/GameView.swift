//
//  GameView.swift
//  cityquest
//
//  Created by Bartos Nicolas on 24/10/2024.
//

import SwiftUI

struct GameView: View {
    @State var selectedMonument: Place = monuments.first! //Pas bien
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            GameMapView(selectedMonument: $selectedMonument)
            GameTabNav(selectedMonument: $selectedMonument)
                .padding(.trailing, 25)
                .padding(.bottom, 50)
        }
    }
}

#Preview {
    GameView()
}
