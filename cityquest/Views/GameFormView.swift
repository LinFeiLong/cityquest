//
//  GameFormView.swift
//  cityquest
//
//  Created by Fernand LIME on 24/10/2024.
//

import SwiftUI

struct GameFormView: View {
    let cityName: String
    @Environment(GameManager.self) var gameManager: GameManager
    @State private var monuments: [Monument] = []
    
    @State private var newGame = Game()

    @State private var isDatePickerVisible: Bool = true
    
    @State private var isLoading: Bool = false
    @State private var isCreated: Bool = false
    @State private var gameIsReady: Bool = false
    
    func createGame() {
        Task {
            isLoading = true
            gameManager.currentGame.scheduled = newGame.scheduled
            gameManager.currentGame.scheduled_date = newGame.scheduled_date
            gameManager.currentGame.distanceMax = newGame.distanceMax
            gameManager.currentGame.durationMax = newGame.durationMax
            try await Task.sleep(for: .seconds(3))
            isLoading = false
            isCreated = true
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.mainDark).ignoresSafeArea()
                VStack {
                    Text("Nouveau Jeu")
                        .font(.title)
                        .fontWeight(.bold)
                        .colorScheme(.dark)
                    
                    Toggle(isOn: $newGame.scheduled) {
                        Text("Programmer une date")
                            .foregroundColor(.white)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color.accent))
                    .colorScheme(.dark)
                    
                    if newGame.scheduled {
                        VStack(alignment: .trailing) {
                            HStack {
                                Spacer()
                                // Date Picker
                                DatePicker("", selection: $newGame.scheduled_date, displayedComponents: [.date])
                                    .labelsHidden()
                                    .datePickerStyle(CompactDatePickerStyle())
                                    .cornerRadius(10)
                                    .tint(.mainDark)
                                
                                // Time Picker
                                DatePicker("", selection: $newGame.scheduled_date, displayedComponents: [.hourAndMinute])
                                    .labelsHidden()
                                    .datePickerStyle(CompactDatePickerStyle())
                                    .cornerRadius(10)
                            }
                            .padding(.vertical)
                            .colorScheme(.dark)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("De combien de temps disposez vous ?")
                            .foregroundColor(.white)
                        // Duration Picker (Hour)
                        HStack {
                            Slider(value: $newGame.durationMax, in: 1...10, step: 1)
                                .accentColor(.accent)
                            Text("\(newGame.durationMax, specifier: "%.0f") h")
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        Text("Distance maximum que vous souhaitez parcourir ?")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 10)
                        HStack {
                            Slider(value: $newGame.distanceMax, in: 5...50, step: 1)
                                .accentColor(.accent)
                            Text("\(newGame.distanceMax, specifier: "%.0f") km")
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                    Button {
                        createGame()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.accentColor)
                                .frame(width: .infinity, height: 50)
                            if isLoading {
                                HStack {
                                    ProgressView()
                                }
                            } else {
                                HStack {
                                    Image(systemName: "play")
                                    Text("Créer la partie")
                                        .font(.headline)
                                }
                                .foregroundColor(.mainDark)
                            }
                        }
                    }
                    .disabled(isLoading || !gameIsReady)
                }
                .padding()
            }
            .navigationDestination(isPresented: $isCreated, destination: {
                GameView()
                    .navigationBarHidden(true)
            })
        }
        .onAppear {
            Task {
                let jsonName = cityName.lowercased()
                gameManager.currentGame = Game()
                gameManager.currentGame.cityName = cityName
                try await gameManager.getStepsFromJSON(jsonName, 5, 5)
                gameIsReady = true
            }
        }
    }
}

#Preview {
    GameFormView(cityName: "Marseille")
        .environment(GameManager())
}
