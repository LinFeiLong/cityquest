//
//  MonudexView.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 24/10/2024.
//

import SwiftUI

struct MonudexView: View {
    let city : City
    var body: some View {

        NavigationStack {
            ZStack {
                Color.color.edgesIgnoringSafeArea(.all)
                VStack() {
                    Text(city.name).font(.title2).foregroundStyle(.accent).fontWeight(.semibold).padding(.vertical)
                    GridCardPlacesComponent(places: city.monuments , isMonudex: true)

                    Spacer()
                }.navigationTitle("Mon Monudex").navigationBarTitleTextColor(.accentColor)
            }
        }

    }
}
#Preview {
    MonudexView(city: cityTest)
}

