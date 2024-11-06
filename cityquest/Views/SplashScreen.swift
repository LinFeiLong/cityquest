//
//  SplashScreen.swift
//  cityquest
//
//  Created by Apprenant 85 on 06/11/2024.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var opacity = 0.0

    var body: some View {
        ZStack {
            Color("color")
                .edgesIgnoringSafeArea(.all)
            
            if !isActive {
                Image("AppIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.5)) {
                            opacity = 1.0
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            withAnimation {
                                isActive = true
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
