//
//  GridCardPlacesComponent.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 24/10/2024.
//

import Foundation
import SwiftUI
import SwiftData

struct GridCardPlacesComponent: View {
    @Query var  user : [User]
    var cityId : String?
    let places : [Place]
    var isMonudex = false
    var body: some View {

        if user.isEmpty || isMonudex == false {
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
        else {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()) ,GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(places) { monument in
                        NavigationLink {
                            DescriptionView(detailThing: monument)
                        } label: {
                            CardPlaceComponent(place: monument, isHighlighted: user[0].isVisited(idCity: cityId, idMonument: "monument.id")).shadow(radius: 5)
                        }


                    }.padding(.horizontal, 50)



                }

            }

        }
    }
}


#Preview {
    NavigationStack {
        GridCardPlacesComponent(places: monuments)
    }
}
