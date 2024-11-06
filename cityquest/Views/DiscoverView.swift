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
                Color(.color)
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
                            NavigationLink(destination: DescriptionView(detailThing: city)) {

                                CityCard(city: city)
                            }

                        }
                    }
                    .padding(.top)
                }
            }
            .onAppear {
                loadCities()
                for city in citysList {
                    city.loadMonuments()
                }
            }
        }
    }

    private func loadCities() {
        guard let url = Bundle.main.url(forResource: "cities", withExtension: "json") else {
            print("Failed to locate cities.json in bundle.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode([City].self, from: data)
            citysList = decodedData}
        catch {
            print("Failed to load or decode cities.json: \(error)")
        }
    }
}

#Preview {
    DiscoverView()
}
