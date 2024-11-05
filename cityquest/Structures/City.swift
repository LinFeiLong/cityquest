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

    init( id: String = UUID().uuidString, name: String, description: String, coordinate: Coordinate, image: String, places: [Place] = [], monuments: [Monument] = [], wikipedia_page_url: String?) {
        self.id = id
        self.name = name
        self.description = description
        self.coordinate = coordinate
        self.image = image
        self.places = places
        self.monuments = monuments
        self.wikipedia_page_url = wikipedia_page_url
    }

    
    private enum CodingKeys: String, CodingKey {
        case id, name, description, image, coordinate, wikipedia_page_url
    }

}
extension City {
    func getProgess(history: [String : [String]]) -> Double {
        let nbMonuments = monuments.count
        if nbMonuments == 0 { return 0 }
        guard let historyCity = history[id] else { return 1 }
        // print()
        return Double(historyCity.count)/Double(nbMonuments)

    }

    func loadMonuments() {

        guard let url = Bundle.main.url(forResource: name.lowercased(), withExtension: "json") else {
            print("Failed to create URL \( name.lowercased())")
            return
        }


        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            monuments = try decoder.decode([Monument].self, from: data)

        } catch {
            print("Failed to load or decode : \(error)")

        }
    }
}



