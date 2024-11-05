//
//  PlaceStructure.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 24/10/2024.
//

import Foundation
import DeveloperToolsSupport
import CoreLocation

class Place : Identifiable, DetailProtocol, Codable {

    var id = UUID()
    let name: String
    var description: String
    var image: String
    var coordinate: Coordinate
    var wikipedia_page_url: String?

    var location: CLLocationCoordinate2D {
        coordinate.toCLLocationCoordinate2D()
    }

    init(name: String, description: String, image: String, latitude: Double, longitude: Double, wikipedia_page_url: String?) {
        self.name = name
        self.description = description
        self.image = image
        self.coordinate = Coordinate(latitude: latitude, longitude: longitude)
        self.wikipedia_page_url = wikipedia_page_url
    }


}

extension Place: Equatable {
    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.id == rhs.id
    }
}



