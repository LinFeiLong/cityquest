//
//  ButtonView.swift
//  cityquest
//
//  Created by Fernand LIME on 24/10/2024.
//

import SwiftUI

struct ButtonView: View {

    var label: String
    var icon: String
    var fontColor: Color
    var color: Color

    var body: some View {
        HStack {
            if icon.isEmpty == false {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            Text(label)
                .fontWeight(.bold)
        }
        .foregroundStyle(fontColor)
        .fontDesign(.default)
        .padding()
        .frame(maxWidth: .infinity) // Make the button full width
        .background(color)
        .clipShape(
            RoundedRectangle(cornerSize: CGSize(width: 40, height: 40))
        )
    }
}

#Preview {
    VStack {
        ButtonView(label: "Jouer", icon: "play.fill", fontColor: Color("MainColor"), color: Color("AccentColor"))
    }
    .padding() // Optional: Add some padding around the VStack
}

