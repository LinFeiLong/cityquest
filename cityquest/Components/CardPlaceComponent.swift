//
//  CarPlaceComponent.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 24/10/2024.
//

import SwiftUI


struct CardPlaceComponent: View {
    let place: Place
    let isHighlighted: Bool

    var body: some View {

        ZStack {
            Image(place.image)
                .resizable().scaledToFill().frame(minWidth: 110, minHeight: 140 )
               .blur(radius: isHighlighted ? 0 : 1).grayscale( isHighlighted ? 0 : 1).clipShape(RoundedRectangle(cornerRadius: 15)).overlay {
                    VStack {
                        Spacer(minLength: 95)
                        UnevenRoundedRectangle(cornerRadii:  RectangleCornerRadii(topLeading: 0, bottomLeading: 15, bottomTrailing: 15, topTrailing: 0)).fill(isHighlighted ? .main : .gray  ).opacity(0.7).overlay {
                            Text(place.name).font(.caption2)
                            .foregroundColor(isHighlighted ? .accent : .white)}


                    }

                }



        }
    }
}

#Preview {
    CardPlaceComponent(place: Monument.seed[0], isHighlighted: false)
    }


#Preview {
    CardPlaceComponent(place: Monument.seed[0], isHighlighted: true)
}
