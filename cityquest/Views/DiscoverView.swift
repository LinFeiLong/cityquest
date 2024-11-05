//
//  DiscoverView.swift
//  cityquest
//
//  Created by Fernand LIME on 30/10/2024.
//

import SwiftUI

struct DiscoverView: View {
    @State private var citysList: [City] = []

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

                        ForEach(citysList) { city in
                            CityCard(city: city)
                        }
                    }
                    .padding(.top)
                }
            }
            .onAppear {
                loadCities()
            }
        }
    }

    private func loadCities() {
        guard let url = Bundle.main.url(forResource: "cities-in-discover-view", withExtension: "json") else {
            print("Failed to locate cities.json in bundle.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode([String: [City]].self, from: data)
            citysList = decodedData["citysList"] ?? []
        } catch {
            print("Failed to load or decode cities.json: \(error)")
        }
    }
}

#Preview {
    DiscoverView()
}
