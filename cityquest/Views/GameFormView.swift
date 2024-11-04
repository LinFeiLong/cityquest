//
//  GameFormView.swift
//  cityquest
//
//  Created by Fernand LIME on 24/10/2024.
//

import SwiftUI

struct GameFormView: View {
    
    @State private var monuments: [Monument] = []
    @State private var game: Game = Game()

    @State private var isDatePickerVisible: Bool = true
    
    @State private var isLoading: Bool = false
    @State private var isCreated: Bool = false
    @State private var gameIsReady: Bool = false
    
    func createGame() {
        Task {
            isLoading = true
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
                    
                    Toggle(isOn: $isDatePickerVisible) {
                        Text("Programmer une date")
                            .foregroundColor(.white)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color.accent))
                    .colorScheme(.dark)
                    
                    if isDatePickerVisible {
                        VStack(alignment: .trailing) {
                            HStack {
                                Spacer()
                                // Date Picker
                                DatePicker("", selection: $game.scheduled_date, displayedComponents: [.date])
                                    .labelsHidden()
                                    .datePickerStyle(CompactDatePickerStyle())
                                    .cornerRadius(10)
                                    .tint(.mainDark)
                                
                                // Time Picker
                                DatePicker("", selection: $game.scheduled_date, displayedComponents: [.hourAndMinute])
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
                            Slider(value: $game.durationMax, in: 1...10, step: 1)
                                .accentColor(.accent)
                            Text("\(game.durationMax, specifier: "%.0f") h")
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
                            Slider(value: $game.distanceMax, in: 5...50, step: 1)
                                .accentColor(.accent)
                            Text("\(game.distanceMax, specifier: "%.0f") km")
                                .foregroundColor(.white)
                        }
                    }
                    
//                    VStack(alignment: .leading) {
//                        Text("Vos modes de transport")
//                            .foregroundColor(.white)
//                            .multilineTextAlignment(.leading)
//                        HStack {
//                            
//                        }
//                    }
//                    .frame(maxWidth: .infinity)
                    
                    Spacer()
//                    NavigationLink() {
//                        GameView() //add Game
//                            .navigationBarHidden(true)
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
                GameView(game: $game)
                    .navigationBarHidden(true)
            })
        }
        .onAppear {
            Task {
                do {
                    monuments.removeAll()
                    let data = try await LoadJSONManager().loadJSON(from: "marseille")
                    monuments = data
                    // creation des étapes
                    // Faire une array d'index unique
                    var uniqueNumbers: Set<Int> = []
                    for _ in 0..<5 {
                        addRandomNumber(max: monuments.count, array: &uniqueNumbers)
                    }
                    // Parcourir l'array et créer chaque étape
                    for index in uniqueNumbers {
                        var newStep = Step(place: monuments[index])
                        var uniqueQuestionIndex: Set<Int> = []
                        for _ in 0..<5 {
                            addRandomNumber(max: newStep.place.questions.count, array: &uniqueQuestionIndex)
                        }
                        for index in uniqueQuestionIndex {
                            newStep.questions.append(newStep.place.questions[index])
                        }
                        print(newStep)
                        game.steps.append(newStep)
                    }
                    gameIsReady.toggle()
                }
            }

        }
    }
    
    func addRandomNumber(max: Int, array: inout Set<Int>) {
        let randomNumber = Int.random(in: 0..<max)
        if !array.contains(randomNumber) {
            array.insert(randomNumber)
        } else {
            addRandomNumber(max: max, array: &array)
        }
    }
}

#Preview {
    GameFormView()
}
