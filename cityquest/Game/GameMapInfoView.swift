//
//  GameMapInfoView.swift
//  cityquest
//
//  Created by Bartos Nicolas on 28/10/2024.
//

import SwiftUI

struct GameMapInfoView: View {
    let distance: Double?
    let duration: Double?
    
    var calculatedDistance: String {
            guard let distance = distance else { return "Route indisponible" }
            if distance > 1000 {
                return "Distance : \(String(format: "%.2f", distance / 1000)) km"
            } else {
                return "Distance : \(String(format: "%.0f", distance)) m"
            }
        }
        
        var calculatrdTime: String {
            guard let eta = duration else { return "Temps indisponible" }
            return convertTime(Int(eta))
        }
        
        func convertTime(_ time: Int) -> String {
            let hours = time / 3600
            let minutes = (time % 3600) / 60
    //        let seconds = time % 60
            return "\(hours != 0 ? " \(hours) h" : "") \(minutes) min"
        }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30.0)
            .fill(.mainDark)
            .frame(width: 200, height: 60)
            .overlay {
                VStack {
                    Text(calculatedDistance)
                    HStack(spacing: 0) {
                        Image(systemName: "figure.walk")
                        Text(calculatrdTime)
                    }
                }
                .foregroundStyle(.accent)
                .font(.headline)
            }
            .padding(.vertical, 10)
            .shadow(radius: 2)
    }
}

#Preview {
    
    GameMapInfoView(distance: 1203, duration: 666)
}
