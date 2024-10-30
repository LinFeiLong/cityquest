//
//  MonumentStructure.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 24/10/2024.
//

import Foundation
import SwiftUI

struct Response {
    var response: String
    var isCorrect: Bool
}

struct Question {
    var question: String
    var isAnsweredCorrectly: Bool
    var isAnswered: Bool
    var response: [Response]
}

class Monument: Place {
    var questions: [Question]

    init(name: String, description: String, image: ImageResource, latitude: Double, longitude: Double, questions: [Question]) {
        self.questions = questions
        super.init(name: name, description: description, image: image, latitude: latitude, longitude: longitude)
    }
}
