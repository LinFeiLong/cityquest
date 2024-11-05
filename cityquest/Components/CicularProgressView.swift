//
//  CicularProgressView.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 04/11/2024.
//

import Foundation

import SwiftUI

struct CircularProgressView: View {
    @State var progressAmount: Double = 0
    @State var progressAmountTarget: Double
    let lineWidth: Double = 5

    var body: some View {
        ZStack {
            Circle()

                .stroke(Color.accent.opacity(0.2), lineWidth: lineWidth)

            Circle()
                .trim(from: 0.0, to: progressAmount)
                .stroke(Color.accent, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .rotationEffect(Angle(degrees: -90))




            VStack {
                Text("\(Int(progressAmount * 100))%")
                    
                    .foregroundColor(.white)
            }
        }.onAppear {

            withAnimation(.smooth(duration: 2.5)) {

                    progressAmount = progressAmountTarget
                }


        }
    }
}

#Preview {
    CircularProgressView(progressAmountTarget: 0.5)
}
