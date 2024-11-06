//
//  QuestionView.swift
//  cityquest
//
//  Created by Fernand LIME on 28/10/2024.
//

import SwiftUI

struct Choice: Identifiable, Equatable {
    let id = UUID()
    let label: String
}

struct QuestionView: View {
    @Environment(GameManager.self) var gameManager: GameManager
    
    @Binding var showView: ShowView
    
    var currentStep: Step {
        gameManager.currentGame.currentStep
    }
    
    var description: String = ""
    var choices: [Choice] = []
    @State private var selectedChoice: Choice?

    var body: some View {
            VStack(spacing: 20) {
                Text("Question \(currentStep.indexOfQuestion + 1) / \(currentStep.questions.count)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()

                ForEach(Array(currentStep.questions.enumerated()), id: \.0) { (index, question) in
                    if index == currentStep.indexOfQuestion {
                        SelfQuestionView(question: question) {
                            showView = .photo
                        }
                    }
                }

            }.padding()
        }
}

struct SelfQuestionView: View {
    @Environment(GameManager.self) var gameManager: GameManager
    let question: Question
    var lastAction: () -> ()
    
    @State var selectedResponse: Response?
    
    var isLastQuestion: Bool {
        gameManager.currentGame.steps[gameManager.currentGame.indexOfStep].questions.count == gameManager.currentGame.steps[gameManager.currentGame.indexOfStep].indexOfQuestion + 1
    }
    
    var disableButton: Bool {
        selectedResponse == nil
    }
    
    func checkAnswer() {
        guard let selectedResponse else { return }
        if selectedResponse.isCorrect {
            gameManager.currentGame.steps[gameManager.currentGame.indexOfStep].questions[gameManager.currentGame.steps[gameManager.currentGame.indexOfStep].indexOfQuestion].isAnsweredCorrectly = true
        }
        gameManager.currentGame.steps[gameManager.currentGame.indexOfStep].questions[gameManager.currentGame.steps[gameManager.currentGame.indexOfStep].indexOfQuestion].isAnswered = true
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(question.question)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding(.bottom, 50)
            
            ForEach(question.response, id: \.response) { response in
                let isSelected = response == selectedResponse
                
                Button(action: {
                    selectedResponse = response
                }) {
                    ButtonView(label: response.response, icon: "", fontColor: .mainDark, color: isSelected ? .accent : .mainLight)
                }
            }
            
            Spacer()
            
            if isLastQuestion {
                Button {
                    checkAnswer()
                    lastAction()
                } label: {
                    ButtonView(label: "Voir les résultats", icon: "", fontColor: disableButton ? .mainLight : .mainDark, color: disableButton ? .gray : .accent)
                }
                .disabled(disableButton)
                
            } else {
                Button {
                    checkAnswer()
                    gameManager.currentGame.steps[gameManager.currentGame.indexOfStep].indexOfQuestion += 1
                } label: {
                    ButtonView(label: "Question suivante", icon: "", fontColor: disableButton ? .mainLight : .mainDark, color: disableButton ? .gray : .accent)
                }
                .disabled(disableButton)
                
            }
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var showView: ShowView = .question
    ZStack {
        Color(.mainDark).ignoresSafeArea()
        GamePreviewWrapper {
            QuestionView(showView: $showView)
        }
    }
}

