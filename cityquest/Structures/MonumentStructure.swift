//
//  MonumentStructure.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 24/10/2024.
//

import Foundation
import SwiftUI

struct Response: Decodable {
    var response: String
    var isCorrect: Bool
}

struct Question: Decodable {
    var question: String
    var isAnsweredCorrectly: Bool
    var isAnswered: Bool
    var response: [Response]
}

class Monument: Place {
    var questions: [Question]

    init(name: String, description: String, image: String, latitude: Double, longitude: Double, questions: [Question]) {
        self.questions = questions
        super.init(name: name, description: description, image: image, latitude: latitude, longitude: longitude)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decode properties
        let name = try container.decode(String.self, forKey: .name)
        let description = try container.decode(String.self, forKey: .description)
        let image = try container.decode(String.self, forKey: .image)
        let latitude = try container.decode(Double.self, forKey: .latitude)
        let longitude = try container.decode(Double.self, forKey: .longitude)
        self.questions = try container.decode([Question].self, forKey: .questions)
        
        // Call the superclass initializer
        super.init(name: name, description: description, image: image, latitude: latitude, longitude: longitude)
    }
    
    private enum CodingKeys: String, CodingKey {
        case name, description, image, latitude, longitude, questions
    }
}
