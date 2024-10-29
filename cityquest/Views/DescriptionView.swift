//
//  DescriptionView.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 24/10/2024.
//

import SwiftUI

struct DescriptionView: View {
    let detailThing : DetailProtocol

    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            ScrollView{
                Image(detailThing.image).resizable().scaledToFit().frame(width: .infinity).padding(.vertical)
                Text(detailThing.description).padding()
                    .foregroundStyle(Color.white)

                if detailThing is City {
                    VStack {

                        VStack(alignment: .leading) {
                            Text("Les monuments phares :").font(.title2)
                            GridCardPlacesComponent(places: (detailThing as! City).monuments )
                            Text("Les bonnes adresse :").font(.title2)
                            GridCardPlacesComponent(places: (detailThing as! City).places)
                        }
                    }.padding()
                    ButtonView(label: "Jouer", icon: "play.fill", fontColor: .main, color: .accent) .padding(.vertical)
                }
            }.navigationTitle(detailThing.name).navigationBarTitleDisplayMode(.automatic)
        }

    }
}

#Preview {
    NavigationStack {
        DescriptionView(detailThing: cityTest)
    }
}
