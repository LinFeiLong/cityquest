//
//  GameView.swift
//  cityquest
//
//  Created by Bartos Nicolas on 24/10/2024.
//

import SwiftUI
import MapKit

struct GameView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @Environment(GameManager.self) var gameManager: GameManager
    
//    @State var selectedMonument: Monument //Pas bien
    @State var isOnDestination: Bool = false
//    @State var currentRoute: MKRoute?
    
    var colors: [Color] {
        let buttonColor = colorScheme == .dark ? Color.accent : .color
        let textColor = colorScheme == .dark ? .color : Color.accent
        return [buttonColor, textColor]
    }
    
    @State private var index: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ZStack(alignment: .top) {
                GameMapView(colors: colors)
                GameMapInfoView()
            }
            if isOnDestination {
                GameQuestionsView(isPresented: $isOnDestination)
            } else {
                HStack(alignment: .bottom) {
                    Button {
                        isOnDestination.toggle()
                    } label: {
                        Circle()
                            .fill(.mainDark)
                            .frame(width: 80)
                            .overlay {
                                Image(systemName: "questionmark.diamond")
                                    .font(.system(size: 40))
                            }
                    }
                    Spacer()
                    GameTabNav()
                        
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 50)
                
            }
        }
    }
}

#Preview {
    GameView()
        .environment(GameManager())
}
