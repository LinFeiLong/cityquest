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
                .resizable().scaledToFill().frame(maxWidth: 100, maxHeight: 140 )
               .blur(radius: isHighlighted ? 0 : 1).grayscale( isHighlighted ? 0 : 1).clipShape(RoundedRectangle(cornerRadius: 15)).overlay {
                    VStack {
                        Spacer(minLength: 95)
                        UnevenRoundedRectangle(cornerRadii:  RectangleCornerRadii(topLeading: 0, bottomLeading: 15, bottomTrailing: 15, topTrailing: 0)).fill(Color.purple.opacity(0.7)).overlay {
                            Text(place.name).font(.caption2)
                                .foregroundColor(.white)}


                    }

                }



        }
    }
}

#Preview {
    CardPlaceComponent(place: Place(name: "Notre Dame de La Garde", description: "Marseille", image: .imageTestMonument, cordinatesLAT: 3.0, cordinatesLON: 4.0), isHighlighted: false).containerRelativeFrame(.horizontal) { size, axes in
        size * 0.5
    }
}

#Preview {
    CardPlaceComponent(place: Place(name: "Notre Dame de La Garde", description: "Marseille", image: .unknown, cordinatesLAT: 3.0, cordinatesLON: 4.0), isHighlighted: true)
}
