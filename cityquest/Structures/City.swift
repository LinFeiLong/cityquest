//
//  City.swift
//  cityquest
//
//  Created by Apprenant 85 on 25/10/2024.
//

import Foundation
import CoreLocation
import DeveloperToolsSupport


class City: Identifiable, DetailProtocol, Decodable {
    let id = UUID()
    let name: String
    var description: String
    var coordinate: Coordinate
    var image: String
    var places: [Place]
    var monuments: [Monument]

    var location: CLLocationCoordinate2D {
        coordinate.toCLLocationCoordinate2D()
    }

    // Initialiseur pour la décodabilité
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case coordinate
        case image
        case places
        case monuments
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        coordinate = try container.decode(Coordinate.self, forKey: .coordinate)
        image = try container.decode(String.self, forKey: .image)
        
        if let placesArray = try? container.decode([Place].self, forKey: .places) {
            places = placesArray
        } else {
            places = []
        }

        if let monumentsArray = try? container.decode([Monument].self, forKey: .monuments) {
            monuments = monumentsArray
        } else {
            monuments = []
        }
    }


    init(name: String, description: String, coordinate: Coordinate, image: String, places: [Place] = [], monuments: [Monument] = []) {
        self.name = name
        self.description = description
        self.coordinate = coordinate
        self.image = image
        self.places = places
        self.monuments = monuments
    }
}
