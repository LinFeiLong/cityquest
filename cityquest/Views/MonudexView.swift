//
//  MonudexView.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 24/10/2024.
//

import SwiftUI

struct MonudexView: View {
    let title: String = "Marseille"
    let monuments : [Monument]
    var body: some View {

        NavigationStack {
            ZStack {
                Color.main.edgesIgnoringSafeArea(.all)
                VStack() {
                    Text(title).font(.title2).foregroundStyle(.accent).fontWeight(.semibold).padding(.vertical)
                    GridCardPlacesComponent(places: monuments)

                    Spacer()
                }.navigationTitle("Mon Monudex")
            }
        }

    }
}
#Preview {
    MonudexView(monuments: monuments)
}

