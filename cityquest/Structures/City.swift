//
//  City.swift
//  cityquest
//
//  Created by Apprenant 85 on 25/10/2024.
//

import Foundation


class City: Identifiable {
    let id = UUID()
    let name: String
    var description: String
    var latitude: Double
    var longitude: Double
    var image: String
    var places: [Place]  // Class existante.

    init(name: String, description: String, latitude: Double, longitude: Double, image: String, places: [Place]) {
        self.name = name
        self.description = description
        self.latitude = latitude
        self.longitude = longitude
        self.image = image
        self.places = places
    }
}
