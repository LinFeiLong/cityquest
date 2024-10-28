//
//  City.swift
//  cityquest
//
//  Created by Apprenant 85 on 25/10/2024.
//

import Foundation
import CoreLocation
import DeveloperToolsSupport


class City: Identifiable, DetailProtocol {

    
    let id = UUID()
    let name: String
    var description: String
    var coordinate: Coordinate
    var image: ImageResource
    var places: [Place]
    var monuments: [Monument]

    var location: CLLocationCoordinate2D {
        coordinate.toCLLocationCoordinate2D()
    }

    init(name: String, description: String, coordinate: Coordinate, image: ImageResource, places: [Place], Monuments: [Monument]) {
        self.name = name
        self.description = description
        self.coordinate = coordinate
        self.image = image
        self.places = places
        self.monuments = Monuments
    }
}
