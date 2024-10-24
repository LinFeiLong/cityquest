//
//  GameFormView.swift
//  cityquest
//
//  Created by Fernand LIME on 24/10/2024.
//

import SwiftUI

struct GameFormView: View {
    @State private var isOn: Bool = true
    @State private var selectedDate = Date()
    @State private var selectedDuration = Date()
    @State private var selectedDistance: Double = 0

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    HStack() {
                        Text("Programmer le jeu")
                            .foregroundColor(.white)
                        Toggle(isOn: $isOn) {
                        }
                        .toggleStyle(SwitchToggleStyle(tint: Color.green))
                    }

                    HStack {
                            // Date Picker
                        DatePicker("", selection: $selectedDate, displayedComponents: [.date])
                            .labelsHidden()
                            .datePickerStyle(CompactDatePickerStyle())
                            .padding()
                            .cornerRadius(10)

                            // Time Picker
                        DatePicker("", selection: $selectedDate, displayedComponents: [.hourAndMinute])
                            .labelsHidden()
                            .datePickerStyle(CompactDatePickerStyle())
                            .padding()
                            .cornerRadius(10)
                            .foregroundColor(Color.yellow)
                    }
                    .padding()

                    HStack {
                        Text("De combien de temps disposez vous ?")
                            .foregroundColor(.white)
                        Spacer()
                            // Duration Picker (Hours and Minutes)
                        DatePicker("", selection: $selectedDuration, displayedComponents: [.hourAndMinute])
                            .labelsHidden()
                            .datePickerStyle(CompactDatePickerStyle())
                            .padding()
                            .cornerRadius(10)
                            .foregroundColor(Color.yellow)
                    }

                    VStack(alignment: .leading) {
                        Text("Distance maximum que vous souhaitez parcourir ?")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        HStack {
                            Text("0km")
                                .foregroundColor(.white)
                            Slider(value: $selectedDistance, in: 0...20, step: 1)
                                .padding()
                                .accentColor(.white)
                            Text("20km")
                                .foregroundColor(.white)
                        }
                    }

                    VStack(alignment: .leading) {
                        Text("Vos modes de transport")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        HStack {

                        }
                    }
                    .frame(maxWidth: .infinity)

                    Button(action: {}) {
                        ButtonView(label: "Jouer", icon: "play.fill", fontColor: Color("MainColor"), color: Color("AccentColor")) {
                            print("Button tapped!")
                        }
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("MainColor"))
        }
    }
}

#Preview {
    GameFormView()
}
