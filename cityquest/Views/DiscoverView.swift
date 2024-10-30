//
//  DiscoverView.swift
//  cityquest
//
//  Created by Fernand LIME on 30/10/2024.
//

import SwiftUI
struct DiscoverView: View {
    var citysList: [City]

    var body: some View {
        NavigationStack {
            ZStack {
                Color("MainColor")
                    .edgesIgnoringSafeArea(.all)

                ScrollView {
                    VStack(spacing: 16) {
                        HStack {
                            Text("Découvrir")
                                .font(.largeTitle.bold())
                                .foregroundStyle(Color("AccentColor"))
                            Spacer()
                        }
                        .padding(.horizontal)

                        ForEach(citysList, id: \.name) { city in
                            CityCard(
                                cityName: city.name,
                                onDiscover: testDiscover,
                                onPlay: testPlay,
                                image: .marseilleVueDepuisLaBasiliqueNotreDameDeLa1
                            )
                        }
                    }
                }
            }
        }
    }
}

func testDiscover() {
    print("Discovering")
}

func testPlay() {
    print("Playing")
}

#Preview {
    HStack {
        DiscoverView(
            citysList: [
                City(
                    name: "Paris",
                    description: "The city of lights",
                    coordinate: Coordinate(latitude: 48.8566, longitude: 2.3522),
                    image: .imageTestMonument
                ),
                City(
                    name: "Marseille",
                    description: "The port city",
                    coordinate: Coordinate(latitude: 43.2965, longitude: 5.3698),
                    image: .imageTestMonument
                ),
                City(
                    name: "Lyon",
                    description: "The gastronomic capital",
                    coordinate: Coordinate(latitude: 45.7640, longitude: 4.8357),
                    image: .imageTestMonument
                )
            ]
        )
    }
}
