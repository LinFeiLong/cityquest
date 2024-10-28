//
//  GameTabNav.swift
//  cityquest
//
//  Created by Bartos Nicolas on 24/10/2024.
//

import SwiftUI

struct GameTabNav: View {
    @Binding var selectedMonument: Monument
    
//    var btnOffset: Double = 0
    
    private let width: Double = 60
    private var heigth: Double {
        width * Double(monuments.count)
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(.mainDark)
            
//            Circle()
//                .fill(.red)
//                .frame(width: 100)
//                .offset(y: btnOffset)
//                .animation(.spring(duration: 0.7, bounce: 0.5), value: btnOffset)
            
            VStack(spacing: 20) {
                ForEach(Array(monuments.enumerated()), id: \.1.id) { (index, monument) in
                    let isSelected = monument.id == selectedMonument.id
                    Button {
                        selectedMonument = monument
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 39)
                                .foregroundColor(isSelected ? .accent : .mainLight)
                            Text(String(index + 1))
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundColor(isSelected ? .main : .mainDark)
                            
                        }
                    }
                }
            }
        }
        .frame(width: width, height: heigth)
        .shadow(radius: 2)
    }
}

#Preview {
    @Previewable @State var test = monuments[0]
    GameTabNav(selectedMonument: $test)
}
