//
//  EndView.swift
//  cityquest
//
//  Created by Fernand LIME on 28/10/2024.
//

import SwiftUI

struct EndView: View {
    @Environment(GameManager.self) var gameManager: GameManager
    @Environment(\.dismiss) var dismiss
    
    var allSteps: [Step] {
        gameManager.currentGame.steps
    }
    
    var body: some View {
        VStack {
            VStack {
                Text("Félicitations !")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Vous êtes parvenu au bout de votre parcours. Vous avez visité \(allSteps.filter { $0.isFinished }.count) monuments et réalisé \(allSteps.filter { $0.isResolved }.count) Défis")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
            .padding()
            
            ScrollView {
                    Text("Récapitulatif :")
                        .font(.headline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 16)
                    
                ForEach(allSteps) { step in
                        HStack {
                            Text(step.place.name)
                                .foregroundColor(.white)
                                .font(.body)
                                .padding(.leading, 8)
                            
                            Spacer()
                            
                            HStack {
                                Text("\(step.goodQuestions)/\(step.totalOfQuestions)")
                                    .foregroundStyle(.white)
                                Image(systemName: step.isResolved ? "checkmark.circle.fill" : "xmark.circle.fill")
                                    .foregroundColor(step.isResolved ? .green : .red)
                            }
                        }
                        .padding()
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(15)
                    }
                    
                    
                ShareLink(item: "Partage ton avanture CityQuest") {
                    ButtonView(label: "Partage ton aventure", icon: "", fontColor: .mainDark, color: .accent)
                    .padding(.top, 25)
                }
            }
            .padding(.horizontal)
            
            // Share Section
            VStack {
                Text("Merci d'avoir joué avec CityQuest !")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Button{
                    dismiss()
                } label: {
                    ButtonView(label: "C'est fini", icon: "", fontColor: .mainDark, color: .accent)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ZStack {
        Color(.mainDark).ignoresSafeArea()
        GamePreviewWrapper(viewBuilder: { EndView() })
    }
}
