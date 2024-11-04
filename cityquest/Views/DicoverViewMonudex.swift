//
//  DicoverViewMonudex.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 04/11/2024.
//

import Foundation
import SwiftUI
import SwiftData

struct DiscoverViewMonudex: View {
    @Query var  user : [User]
    @State var citysList : [City] = []
    var body: some View {
        ZStack {
            Color("MainColor")
                .edgesIgnoringSafeArea(.all)
            if user.isEmpty {
                VStack {
                    Image(systemName: "person.fill.badge.plus").font(.system(size: 100)).foregroundStyle(.accent)
                    Text("Commencer par enregistrer votre compte pour pouvoir accéder à l'historique de vos monuments visités").foregroundStyle(.white).padding(.horizontal)
                }
            }
            else {
                NavigationStack {

                    ZStack {
                        Color("MainColor")
                            .edgesIgnoringSafeArea(.all)
                        Image("Background")

                        if citysList.isEmpty {

                            VStack {
                                Image(systemName: "medal.star").font(.system(size: 100)).foregroundStyle(.accent)
                                Text(" les monuments visités s'afficheront ici ! ").foregroundStyle(.white).padding(.horizontal)
                            }
                        }
                        else {
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
                                        
                                        if user[0].history.keys.contains(city.id) {
                                            CityCard(city: city)
                                        }



                                    }
                                }
                            }
                        }

                    }
                }.onAppear{
                    if !user.isEmpty {
                        if !user[0].history.isEmpty{
                            if let citiesLoaded = loadCites() {
                                citysList = citiesLoaded
                            }
                        }


                    }
                }

            }

        }

    }


    func loadCites() -> [City]? {
        guard let url = Bundle.main.url(forResource: "cities", withExtension: "json") else {
            print("Failed to locate cities.json ")
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let cities = try decoder.decode([City].self, from: data)
            return cities
        } catch {
            print("Failed to load or decode : \(error)")
            return nil
        }
    }

}

#Preview {
    DiscoverViewMonudex().modelContainer(PreviewContainer.mc)
}

#Preview {
    DiscoverViewMonudex()
}

