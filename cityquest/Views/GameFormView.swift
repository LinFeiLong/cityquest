//
//  GameFormView.swift
//  cityquest
//
//  Created by Fernand LIME on 24/10/2024.
//

import SwiftUI

struct GameFormView: View {

    @State private var isDatePickerVisible: Bool = true
    @State private var selectedDate = Date()
    @State private var selectedDuration: Double = 3
    @State private var selectedDistance: Double = 5
    
    @State private var isLoading: Bool = false
    @State private var isCreated: Bool = false
    
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
                                DatePicker("", selection: $selectedDate, displayedComponents: [.date])
                                    .labelsHidden()
                                    .datePickerStyle(CompactDatePickerStyle())
                                    .cornerRadius(10)
                                    .tint(.mainDark)
                                
                                // Time Picker
                                DatePicker("", selection: $selectedDate, displayedComponents: [.hourAndMinute])
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
                            Slider(value: $selectedDuration, in: 1...10, step: 1)
                                .accentColor(.accent)
                            Text("\(selectedDuration, specifier: "%.0f") h")
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
                            Slider(value: $selectedDistance, in: 5...50, step: 1)
                                .accentColor(.accent)
                            Text("\(selectedDistance, specifier: "%.0f") km")
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
                    .disabled(isLoading)
                }
                .padding()
            }
            .navigationDestination(isPresented: $isCreated, destination: {
                GameView()
                    .navigationBarHidden(true)
            })
        }
        
    }
}

#Preview {
    GameFormView()
}
