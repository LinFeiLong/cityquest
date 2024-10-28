//
//  CoordinateStructure.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 25/10/2024.
//

import Foundation
import CoreLocation

struct Coordinate {
    var latitude: Double
    var longitude: Double

func toCLLocationCoordinate2D() -> CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

}
