//
//  GameQuestionsView.swift
//  cityquest
//
//  Created by Bartos Nicolas on 28/10/2024.
//

import SwiftUI

struct GameQuestionsView: View {
    let monument: Monument
    @Binding var isPresented: Bool
    @State var appearAnim: Bool = false
    var action: () -> Void
    
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.mainDark)
                .shadow(radius: 10)
                .padding(.top, 55)
            VStack {
                // Question View
                Text("Questions")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 75)
                Text("Test")
                Spacer()
                Button("close") {
                    withAnimation(.easeIn(duration: 0.25)) {
                        appearAnim.toggle()
                    } completion: {
                        isPresented.toggle()
                        action()
                    }
                }
            }
            .padding()
        }
        .scaleEffect(appearAnim ? 1 : 0)
        .onAppear {
            withAnimation(.spring(duration: 0.5, bounce: 0.4)) {
                appearAnim.toggle()
            }
        }
        .padding()
    }
}

#Preview {
    GameQuestionsView(monument: monuments.first!, isPresented: .constant(true), action: {})
}
