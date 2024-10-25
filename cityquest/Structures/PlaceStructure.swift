//
//  PlaceStructure.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 24/10/2024.
//

import Foundation
import DeveloperToolsSupport
import CoreLocation

class Place : Identifiable, DetailProtocol {


    let id = UUID()
    let name: String
    var description: String
    var image: ImageResource
    var coordinate: Coordinate
    
    var location: CLLocationCoordinate2D {
        coordinate.toCLLocationCoordinate2D()
    }

    init(name: String, description: String, image: ImageResource, latitude: Double, longitude: Double) {
        self.name = name
        self.description = description
        self.image = image
        self.coordinate = Coordinate(latitude: latitude, longitude: longitude)
    }
}

extension Place: Equatable {
    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.id == rhs.id
    }
}



