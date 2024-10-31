//
//  ContentView.swift
//  cityquest
//
//  Created by Fernand LIME on 18/10/2024.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        TabView {
            Tab("Discover", systemImage: "magnifyingglass") {
                DiscoverView(
                    citysList: [
                        City(
                            name: "Paris",
                            description: "The city of lights",
                            coordinate: Coordinate(latitude: 48.8566, longitude: 2.3522),
                            image: ".imageTestMonument"
                        ),
                        City(
                            name: "Marseille",
                            description: "The port city",
                            coordinate: Coordinate(latitude: 43.2965, longitude: 5.3698),
                            image: ".imageTestMonument"
                        ),
                        City(
                            name: "Lyon",
                            description: "The gastronomic capital",
                            coordinate: Coordinate(latitude: 45.7640, longitude: 4.8357),
                            image: ".imageTestMonument"
                        )
                    ]
                )                }

            Tab("Monudex", systemImage: "tray.and.arrow.down.fill") {
                MonudexView(monuments: monuments)
                }
            Tab("Profil", systemImage: "person") {
              UserView()
                }

        }
    }
}

#Preview {
    FirstView()
}
