//
//  GridCardPlacesComponent.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 24/10/2024.
//

import Foundation
import SwiftUI

struct GridCardPlacesComponent: View {
    let places : [Place]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()) ,GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                ForEach(places) { monument in
                    NavigationLink {
                        DescriptionView(detailThing: monument)
                    } label: {
                        CardPlaceComponent(place: monument, isHighlighted: true).shadow(radius: 5)
                    }


                }.padding(.horizontal, 50)



            }

        }
    }
}


#Preview {
    NavigationStack {
        GridCardPlacesComponent(places: monuments)
    }
}
