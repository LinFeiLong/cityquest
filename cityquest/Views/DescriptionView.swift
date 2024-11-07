//
//  DescriptionView.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 24/10/2024.
//

import SwiftUI

struct DescriptionView: View {
    let detailThing : DetailProtocol
    @State var scroo = ScrollPosition(id: "BO", anchor: .zero)
    var body: some View {
        ZStack {
            Color.color.ignoresSafeArea()
            VStack {
                ScrollView{
                    if let url = detailThing.wikipedia_page_url {
                        WikipediaImage(url: url)
                            .aspectRatio(contentMode: .fit)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 258, maxHeight: 258)
                    } else {
                        VStack {
                        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 258, maxHeight: 258)
                    }

                    Text(detailThing.description).padding()
                        .foregroundStyle(Color.white)

                    if detailThing is City {
                        VStack {
                            VStack(alignment: .leading) {
                                Text("Les monuments phares :").foregroundStyle(.accent).fontWeight(.bold)
                                GridCardPlacesComponent(places: (detailThing as! City).monuments )
                            }
                        }.padding()



                    }

                }
                if detailThing is City {
                    NavigationLink(destination: GameFormView(cityName: detailThing.name)) {
                        ButtonView(label: "Jouer", icon: "play.fill", fontColor: .color, color: .accent).padding()
                    }
                }

            }
            .navigationTitle(detailThing.name)
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarTitleTextColor(.accentColor)
        }

    }
}

#Preview {
    NavigationStack {
        DescriptionView(detailThing: cityTest)
    }
}

