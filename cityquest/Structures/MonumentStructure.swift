//
//  MonumentStructure.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 24/10/2024.
//

import Foundation
import SwiftUI
import SwiftData

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
    var questions: [Question] = []

    init(name: String, description: String, image: String, latitude: Double, longitude: Double, questions: [Question], wikipedia_page_url: String?) {
        self.questions = questions
        super.init(
            name: name,
            description: description,
            image: image,
            latitude: latitude,
            longitude: longitude,
            wikipedia_page_url: wikipedia_page_url
        )
    }

    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try container.decode(String.self, forKey: .name)
        let description = try container.decode(String.self, forKey: .description)
        let image = try container.decode(String.self, forKey: .image)
        let latitude = try container.decode(Double.self, forKey: .latitude)
        let longitude = try container.decode(Double.self, forKey: .longitude)
        self.questions = try container.decode([Question].self, forKey: .questions)
        let wikipedia_page_url = try container.decode(String?.self, forKey: .wikipedia_page_url)

        // Call the superclass initializer
        super.init(name: name, description: description, image: image, latitude: latitude, longitude: longitude, wikipedia_page_url: wikipedia_page_url)
    }
    
    private enum CodingKeys: String, CodingKey {
        case name, description, image, latitude, longitude, questions, wikipedia_page_url
    }


    //    private enum CodingKeys: String, CodingKey {
    //        case questions
    //    }
}
