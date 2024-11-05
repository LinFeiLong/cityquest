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

    
    let id : String
    let name: String
    var description: String
    var coordinate: Coordinate
    var image: String
    var places: [Place] = []
    var monuments: [Monument] = []
    var wikipedia_page_url: String?


    var location: CLLocationCoordinate2D {
        coordinate.toCLLocationCoordinate2D()
    }

    init( id: String = UUID().uuidString, name: String, description: String, coordinate: Coordinate, image: String, places: [Place] = [], monuments: [Monument] = []) {
        self.id = id
        self.name = name
        self.description = description
        self.coordinate = coordinate
        self.image = image
        self.places = places
        self.monuments = monuments
        self.wikipedia_page_url = nil
    }

    private enum CodingKeys: String, CodingKey {
        case id, name, description, image, coordinate, wikipedia_page_url
    }

}


