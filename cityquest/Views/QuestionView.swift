//
//  QuestionView.swift
//  cityquest
//
//  Created by Fernand LIME on 28/10/2024.
//

import SwiftUI

struct Choice: Identifiable, Equatable {
    let id = UUID()
    let label: String
}

struct QuestionView: View {
    var number: Int = 1
    var total: Int = 5
    var description: String = ""
    var choices: [Choice] = []
    @State private var selectedChoice: Choice?



    var body: some View {
        QuestionBG {
            VStack(spacing: 20) {
                Text("Question \(number) / \(total)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text(description)
                    .font(.body)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 32)
                Spacer()

                ForEach(choices) { choice in
                    Button(action: {
                        selectedChoice = choice
                    }) {
                        Text(choice.label)
                            .fontWeight(.bold)
                            .foregroundColor(Color("MainColor"))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(selectedChoice == choice ? Color.white : Color.white.opacity(0.30))
                            .cornerRadius(25)
                    }
                }

                ButtonView(label: "Question suivante", icon: "", fontColor: Color("MainColor"), color: Color("AccentColor"))
                    .padding(.top)
            }.padding()
        }
    }
}

#Preview {
    QuestionView(
        number: 1,
        total: 5,
        description: "Une question quelconque en rapport avec le monument",
        choices: [
            Choice(label: "Jean Pierre"),
            Choice(label: "Jean Michel"),
            Choice(label: "Jean Jean"),
            Choice(label: "La réponse D")
        ]
    )
}

