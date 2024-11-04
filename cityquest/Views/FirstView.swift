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
                        cityTest
                        ,
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
                MonudexView(city: cityTest)
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
