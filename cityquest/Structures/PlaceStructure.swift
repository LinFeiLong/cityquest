//
//  PlaceStructure.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 24/10/2024.
//

import Foundation
import DeveloperToolsSupport
import CoreLocation


class Place : Identifiable {
    let id = UUID()
    let name: String
    var description: String
    var image: ImageResource
    let cordinatesLAT : Double
    let cordinatesLON : Double
    var cordinates: CLLocationCoordinate2D { CLLocationCoordinate2D(latitude: cordinatesLAT, longitude: cordinatesLON) }


    init(name: String, description: String, image: ImageResource, cordinatesLAT: Double, cordinatesLON: Double) {
        self.name = name
        self.description = description
        self.image = image
        self.cordinatesLAT = cordinatesLAT
        self.cordinatesLON = cordinatesLON
    }

}
