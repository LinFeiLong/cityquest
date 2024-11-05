//
//  LoadJSONManager.swift
//  cityquest
//
//  Created by Bartos Nicolas on 04/11/2024.
//

import Foundation

class LoadJSONManager {
    func loadJSON(from fileName: String) async throws -> [Monument] {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            return []
        }
        var monuments: [Monument] = []
        let decoder = JSONDecoder()
        do {
            let data = try decoder.decode([Monument].self, from: Data(contentsOf: url))
            for monument in data {
                monuments.append(monument)
            }
        } catch {
            print("Error: \(error)")
        }
        return monuments
    }
}
