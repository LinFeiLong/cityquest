//
//  GameMapInfoView.swift
//  cityquest
//
//  Created by Bartos Nicolas on 28/10/2024.
//

import SwiftUI
import MapKit

struct GameMapInfoView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(GameManager.self) var gameManager: GameManager

    var notRoute: Bool {
        gameManager.currentRoute == nil
    }
    
    var calculatedDistance: String {
        guard let route = gameManager.currentRoute else { return "--" }
        if route.distance > 1000 {
            return "\(String(format: "%.2f", route.distance / 1000)) km"
            } else {
                return "\(String(format: "%.0f", route.distance)) m"
            }
        }
        
        var calculatrdTime: String {
            guard let route = gameManager.currentRoute else { return "--" }
            return convertTime(Int(route.expectedTravelTime))
        }
        
        func convertTime(_ time: Int) -> String {
            let hours = time / 3600
            let minutes = (time % 3600) / 60
    //        let seconds = time % 60
            return "\(hours != 0 ? " \(hours) h" : "") \(minutes) min"
        }
    
    var body: some View {
        ZStack {
            HStack {
                Circle()
                    .fill(.mainDark)
                    .frame(width: 40)
                    .overlay {
                        Image(systemName: "arrowshape.backward.fill")
                            .foregroundStyle(.white)
                    }
                    .onTapGesture { dismiss() }
                    .padding()
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 30.0)
                .fill(.white)
                .stroke(.mainDark, style: StrokeStyle(lineWidth: 1))
                .frame(width: 260, height: 40)
                .shadow(radius: 2)
                .overlay {
                    HStack {
                        Spacer()
                        if notRoute {
                            Text("Pas d'itinéraire")
                        } else {
                            HStack {
                                Image(systemName: "figure.walk")
                                Text(calculatedDistance)
                            }
                            HStack(spacing: 0) {
                                Image(systemName: "clock")
                                Text(calculatrdTime)
                            }
                        }
                        Spacer()
                    }
                    .foregroundStyle(.color)
                    .font(.headline)
                }
                .padding(.vertical, 10)
        }
    }
}

#Preview {
    ZStack {
        Color(.blue).ignoresSafeArea()
        GameMapInfoView()
            .environment(GameManager())
    }

}
