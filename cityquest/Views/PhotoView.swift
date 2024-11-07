//
//  PhotoView.swift
//  cityquest
//
//  Created by Fernand LIME on 28/10/2024.
//

import SwiftUI
import SwiftData

struct PhotoView: View {
    @Query var  user : [User]
    @Environment(GameManager.self) var gameManager: GameManager
    @Binding var showView: ShowView
    @Binding var isPresented: Bool
    
    @State var showPhoto: Bool = false
    
    var currentStep: Step {
        gameManager.currentGame.currentStep
    }
    
    var correctQuestions: Int {
        currentStep.questions.filter(\.isAnsweredCorrectly).count
    }
    
    var isLastStep: Bool {
        gameManager.currentGame.currentStep == gameManager.currentGame.steps.last
    }



    var body: some View {
            VStack {
                VStack() {
                    Text("Bravo !")
                        .font(.title)
                        
                    Text("Vous avez réussi le défi")
                        .font(.title2)
                    
                    Text("\(correctQuestions) / \(currentStep.questions.count) questions correctes")
                        .font(.headline)
                    
                    Text("Prenez une photo et obtenez des récompenses en complétant votre album souvenir.")
                        .font(.body)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .padding(.top, 32)
                }
                .fontWeight(.bold)
                .foregroundColor(.white)

                Spacer()
                
                if showPhoto {
                    ZStack(alignment: .topTrailing) {
                        WikipediaImage(url: gameManager.currentGame.currentStep.place.wikipedia_page_url)
                            .frame(maxWidth: .infinity)
                            .frame(height: 193)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .foregroundStyle(.white)

//                        Image("Unknown")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .foregroundStyle(.white)
                        
                        Circle()
                            .fill(.accent)
                            .frame(width: 50)
                            .overlay {
                                Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90.camera")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(10)
                                    .foregroundStyle(.mainDark)
                            }
                            .padding(5)
                            .onTapGesture {
                                showPhoto = false
                            }
                    }
                    .padding()
                    
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 0)
                            .stroke(.mainLight, style: StrokeStyle(lineWidth: 1, dash: [5, 5]))
                            .aspectRatio(contentMode: .fit)
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.accent)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100)
                            .overlay {
                                Image(systemName: "camera")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                                    .foregroundStyle(.mainDark)
                            }
                            .onTapGesture {
                                showPhoto.toggle()
                            }
                    }
                    .padding()
                }
                
                Spacer()
                
                Button {
                    if !user.isEmpty{
                        user[0].addVisit(cityName: gameManager.currentGame.cityName, monumentName: gameManager.currentGame.currentStep.place.name)
                    }


                    if isLastStep {
                        showView = .ending
                    } else {
                        gameManager.currentGame.steps[gameManager.currentGame.indexOfStep].isFinished = true
                        gameManager.currentGame.steps[gameManager.currentGame.indexOfStep].isResolved = true
                        gameManager.currentGame.indexOfStep += 1
                        isPresented = false
                    }
                } label: {
                    ButtonView(label: "Monument suivant", icon: "", fontColor: !showPhoto ? .mainLight : .mainDark, color: !showPhoto ? .gray : .accent)
                }
                .disabled(!showPhoto)
                
            }
            .padding()
        }
}

#Preview {
    @Previewable @State var showView: ShowView = .photo
    ZStack {
        Color(.mainDark).ignoresSafeArea()
        GamePreviewWrapper {
            PhotoView(showView: $showView, isPresented: .constant(true))
        }
    }
}
