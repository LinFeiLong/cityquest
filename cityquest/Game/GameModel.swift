//
//  GameModel.swift
//  cityquest
//
//  Created by Bartos Nicolas on 24/10/2024.
//

import Foundation
import CoreLocation

struct Question {
    var question: String
    var isCorrect: Bool
    var isAnswered: Bool
    var response: [Response]
    
    struct Response {
        var response: String
        var isCorrect: Bool
    }
}
// A Remplacer par Place
struct Place: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var description: String
    var coordinate: Coordinate
    var questions: [Question]
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
    
    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.id == rhs.id
    }
}

struct Coordinate {
    var latitude: Double
    var longitude: Double
}

struct Etape {
    var place: Place // Place
    var questions: [Question] // Place -> Question selected in Place at start
    var indexOfQuestion: Int
    var isResolved: Bool
    var isFinished: Bool
    
    var totalOfQuestions: Int {
        questions.count
    }
    
    var questionInProgress: Question? {
        questions.first(where: { $0.isAnswered == false })
    }
}

struct Game {
    var score: Int
    var etapes: [Etape]
    var indexOfEtape: Int
    var scheduled: Bool
    var scheduled_date: Date
    var durationMax: Int
    var distanceMax: Double
    var transportation: Transportation
    
    var etapeInProgress: Etape? {
        etapes.first(where: { $0.isFinished == false })
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
