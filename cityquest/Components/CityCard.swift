//
//  CityCard.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 28/10/2024.
//

import Foundation
import SwiftUI

struct CityCard: View {
    var city: City
    var onDiscover: () -> Void
    var onPlay: () -> Void

    var body: some View {
        ZStack {
            Image(city.image)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
                .mask(RoundedRectangle(cornerRadius: 15, style: .continuous))

            VStack {
                Spacer()

                HStack {
                    Text(city.name)
                        .font(.title.bold())
                        .foregroundColor(Color(hex: "DFF585"))
                    Spacer()

                    Button(action: onDiscover) {
                        HStack {
                            Image(systemName: "magnifyingglass.circle")
                            Text("Découvrir")
                                .font(.subheadline)
                        }
                        .padding(4)
                        .background(Color(hex: "DFF585"))
                        .foregroundColor(Color.purple)
                        .cornerRadius(8)
                    }

                    Button(action: onPlay) {
                        HStack {
                            Image(systemName: "play.circle")
                            Text("Jouer")
                                .font(.subheadline)
                        }
                        .padding(4)
                        .background(Color(hex: "DFF585"))
                        .foregroundColor(Color.purple)
                        .cornerRadius(8)
                    }
                }
                .padding()
                .background(Color.purple.opacity(0.6))
            }
        }
        .frame(width: 350, height: 230)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

// Extension pour utiliser des couleurs hexadécimales
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        switch hex.count {
        case 6: // RGB (24-bit)
            (r, g, b) = (int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: 1
        )
    }
}

#Preview {
    CityCard(
        city: cityTest, onDiscover: { print("Découvrir action") },
        onPlay: { print("Jouer action") }
    )
}
