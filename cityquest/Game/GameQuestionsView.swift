//
//  GameQuestionsView.swift
//  cityquest
//
//  Created by Bartos Nicolas on 28/10/2024.
//

import SwiftUI

struct GameQuestionsView: View {
    let monument: Monument
    
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.mainDark.opacity(0.97))
            VStack {
                Text("Game Questions")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.accent)
                    .padding(.top, 20)
            }
                
        }
        .padding()
    }
}

#Preview {
    GameQuestionsView(monument: monuments.first!)
}
