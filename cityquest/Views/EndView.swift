//
//  EndView.swift
//  cityquest
//
//  Created by Fernand LIME on 28/10/2024.
//

import SwiftUI

struct MonumentRecap: Identifiable {
    let id = UUID()
    let name: String
    let isVisited: Bool
}

struct EndView: View {
    let recaps = [
        MonumentRecap(name: "Basilique Notre-Dame de la Garde", isVisited: true),
        MonumentRecap(name: "Cathédrale La Major", isVisited: true),
        MonumentRecap(name: "Fort Saint-Jean", isVisited: false),
        MonumentRecap(name: "Palais Longchamp", isVisited: false),
        MonumentRecap(name: "Château d'If", isVisited: true),
        MonumentRecap(name: "Vieux Port", isVisited: true)
    ]

    var body: some View {
        VStack {
            QuestionBG {
                ScrollView {
                    VStack(alignment: .center, spacing: 16) {
                        Text("Félicitations !")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        Text("Vous êtes parvenu au bout de votre parcours. Vous avez visité \(recaps.filter { $0.isVisited }.count) monuments et réalisé 4 Défis")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)

                        Text("Récapitulatif :")
                            .font(.headline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .padding(.top, 16)

                        ForEach(recaps) { recap in
                            HStack {
                                Text(recap.name)
                                    .foregroundColor(.white)
                                    .font(.body)
                                    .padding(.leading, 8)

                                Spacer()

                                Image(systemName: recap.isVisited ? "checkmark.circle.fill" : "xmark.circle.fill")
                                    .foregroundColor(recap.isVisited ? .green : .red)
                            }
                            .padding()
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(15)
                        }

                        ButtonView(label: "C'est fini", icon: "", fontColor: Color("MainColor"), color: Color("AccentColor"))
                            .padding(.top, 20)
                    }
                    .padding()
                }

            }

            // Share Section
            QuestionBG {
                VStack {
                    Text("Partage ton aventure avec tes amis")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.bottom, 8)

                    ButtonView(label: "Partager", icon: "", fontColor: Color("MainColor"), color: Color("AccentColor"))
                }
                .padding()
            }.frame(height: 160)
        }
    }
}

#Preview {
    EndView()
}
