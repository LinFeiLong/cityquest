//
//  MonumentStructure.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 24/10/2024.
//

import Foundation
import SwiftUI

struct Response: Codable {
    var response: String
    var isCorrect: Bool
}

struct Question: Codable {
    var question: String
    var isAnsweredCorrectly: Bool
    var isAnswered: Bool
    var response: [Response]
}

class Monument: Place {
    var questions: [Question]

    init(name: String, description: String, image: String, latitude: Double, longitude: Double, questions: [Question]) {
        self.questions = questions
        super.init(
            name: name,
            description: description,
            image: image,
            latitude: latitude,
            longitude: longitude,
            wikipedia_page_url: nil
        )
    }
    
    required init(from decoder: any Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.questions = try container.decode([Question].self, forKey: .questions)
        let wikipedia_page_url = try container.decode(String.self, forKey: .wikipedia_page_url)

        // Call the superclass initializer
        super.init(name: name, description: description, image: image, latitude: latitude, longitude: longitude, wikipedia_page_url: wikipedia_page_url)
    }

    
    private enum CodingKeys: String, CodingKey {
        case name, description, image, latitude, longitude, questions, wikipedia_page_url
    }
}
