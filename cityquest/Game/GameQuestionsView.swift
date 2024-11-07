//
//  GameQuestionsView.swift
//  cityquest
//
//  Created by Bartos Nicolas on 28/10/2024.
//

import SwiftUI

struct GameQuestionsView: View {
    @Environment(GameManager.self) var gameManager: GameManager
    
    @Binding var isPresented: Bool
    @State var appearAnim: Bool = false
    @State var showView: ShowView = .ending
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.mainDark)
                    .shadow(radius: 10)
                VStack {
                    // Question View
                    switch showView {
                    case .question:
                        QuestionView(showView: $showView)
                    case .photo:
                        PhotoView(showView: $showView, isPresented: $isPresented)
                    case .ending:
                        EndView()  
                    }
                }
            }
            .scaleEffect(appearAnim ? 1 : 0)
            .onAppear {
                withAnimation(.spring(duration: 0.5, bounce: 0.4)) {
                    appearAnim.toggle()
                }
            }
            .padding()
        }
        .padding(.top, 55)
    }
}

enum ShowView: Equatable {
    case question, photo, ending
}

#Preview {
    GamePreviewWrapper {
        GameQuestionsView(isPresented: .constant(true))
    }
}
