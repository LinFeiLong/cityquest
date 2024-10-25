//
//  MonumentStructure.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 24/10/2024.
//

import Foundation
import DeveloperToolsSupport

class Monument: Place {
    var questions: [Question]
    
    init(name: String, description: String, image: ImageResource, latitude: Double, longitude: Double, questions: [Question]) {
        self.questions = questions
        super.init(name: name, description: description, image: image, latitude: latitude, longitude: longitude)
    }
}

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
