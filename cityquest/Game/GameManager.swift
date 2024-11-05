//
//  GameManager.swift
//  cityquest
//
//  Created by Bartos Nicolas on 05/11/2024.
//

import Foundation
import MapKit

@Observable
class GameManager {
    var currentGame: Game = Game()
    var currentRoute: MKRoute?
    
    func getStepsFromJSON(_ city: String, _ numberOfSteps: Int, _ numberOfQuestions: Int) async throws {
        do {
            let monuments: [Monument]  = try await LoadJSONManager().loadJSON(from: city)
            // creation des étapes
            // Faire une array d'index unique
            var uniqueNumbers: Set<Int> = []
            for _ in 0..<numberOfSteps{
                addRandomNumber(max: monuments.count, array: &uniqueNumbers)
            }
            // Parcourir l'array et créer chaque étape
            for index in uniqueNumbers {
                var newStep = Step(place: monuments[index])
                // Encore des index uniques pour les questions
                var uniqueQuestionIndex: Set<Int> = []
                for _ in 0..<numberOfQuestions {
                    addRandomNumber(max: newStep.place.questions.count, array: &uniqueQuestionIndex)
                }
                // Ajout des questions à la Step
                for index in uniqueQuestionIndex {
                    newStep.questions.append(newStep.place.questions[index])
                }
                // Ajout de la Step au Game
                currentGame.steps.append(newStep)
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
