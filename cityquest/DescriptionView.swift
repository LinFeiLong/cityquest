//
//  DescriptionView.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 24/10/2024.
//

import SwiftUI

struct DescriptionView: View {
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            ScrollView{

                VStack {
                    VStack(alignment: .leading) {
                        Text("Les monuments phares :").font(.title2)
                        GridCardPlacesComponent(places: monuments)
                        Text("Les monuments phares :").font(.title2)
                        GridCardPlacesComponent(places: monuments)
                    }

                    ButtonView(label: "Jouer", icon: "play.fill", fontColor: .main, color: .accent)
                        .padding(.vertical)
                }.padding()


            }.navigationTitle("Titre de la ville").navigationBarTitleDisplayMode(.automatic)
        }

    }
}

#Preview {
    NavigationStack {
        DescriptionView()
    }
}
