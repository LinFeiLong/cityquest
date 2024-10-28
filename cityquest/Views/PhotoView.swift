//
//  PhotoView.swift
//  cityquest
//
//  Created by Fernand LIME on 28/10/2024.
//

import SwiftUI

struct PhotoView: View {
    var body: some View {
        QuestionBG {
            VStack(spacing: 20) {
                Text("Bravo !")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Vous avez réussi le défi")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("Prenez une photo et obtenez des récompenses en complétant votre album souvenir.")
                    .font(.body)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 32)

                Spacer()

                VStack {
                    Spacer()
                    ZStack {
                        Image(systemName: "camera")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                    }
                    .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                    .background(Color("AccentColor"))
                    .cornerRadius(25)
                    .padding()
                    Spacer()

                    VStack {
                        HStack {
                            Spacer()
                            ZStack {
                                Color("AccentColor")
                                    .frame(width: 48, height: 48)
                                    .cornerRadius(24)

                                Image(systemName: "arrow.triangle.2.circlepath.camera")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(Color("MainColor"))
                            }
                        }
                    }
                    .padding(8)
                }
                .frame(width: 300.0, height: 300.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [2, 2]))
                )

                Spacer()

                ButtonView(label: "Monument suivant", icon: "", fontColor: Color("MainColor"), color: Color("AccentColor"))
                    .padding(.top)
            }.padding()
        }
    }
}

#Preview {
    PhotoView()
}
