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
    @State var selectedMonument: Monument = monuments.first! //Pas bien
    @State var isOnDestination: Bool = false
    @State var currentRoute: MKRoute?
    
    var colors: [Color] {
        let buttonColor = colorScheme == .dark ? Color.accent : Color.main
        let textColor = colorScheme == .dark ? Color.main : Color.accent
        return [buttonColor, textColor]
    }
    
    @State private var index: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ZStack(alignment: .top) {
                GameMapView(route: $currentRoute, selectedMonument: $selectedMonument, colors: colors)
                GameMapInfoView(route: currentRoute)
            }
            if isOnDestination {
                GameQuestionsView(monument: selectedMonument, isPresented: $isOnDestination) {
                    index += 1
                    if index >= monuments.count {
                        index = 0
                    }
                    selectedMonument = monuments[index]
                    print(selectedMonument.name)
                }
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
                    GameTabNav(selectedMonument: $selectedMonument)
                        
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 50)
                
            }
        }
    }
}

#Preview {
    GameView()
}
