//
//  GameModel.swift
//  cityquest
//
//  Created by Bartos Nicolas on 24/10/2024.
//

import Foundation
import CoreLocation
import SwiftData

struct Step {
    var place: Monument // Place
    var questions: [Question] = []// Place -> Question selected in Place at start
    var indexOfQuestion: Int = 0
    var isResolved: Bool = false
    var isFinished: Bool = false

    var totalOfQuestions: Int {
        questions.count
    }
    
    var questionInProgress: Question? {
        questions.first(where: { $0.isAnswered == false })
    }
}

extension Step: CustomStringConvertible {
    var description: String {
        "Etape \(place.name) = \(indexOfQuestion + 1)/\(questions.count) questions"
    }
}

struct Game {
    var score: Int = 0
    var steps: [Step] = []
    var indexOfStep: Int = 0
    var scheduled: Bool = false
    var scheduled_date: Date = Date()
    var durationMax: Double = 3
    var distanceMax: Double = 5
    var transportation: Transportation = .walk
    
    var stepInProgress: Step? {
        steps.first(where: { $0.isFinished == false })
    }
}

enum Transportation: String, Codable {
    case car, walk, transport, ferry
    
    var description: String {
        switch self {
        case .transport: return "En transport en commun"
        case .ferry: return "Par Ferry"
        case .car: return "En voiture"
        case .walk: return "À pied"
        }
    }
    
    var icon: String {
        switch self {
        case .transport: return "bus"
        case .ferry: return "ferry"
        case .car: return "car"
        case .walk: return "figure.walk"
        }
    }
}
