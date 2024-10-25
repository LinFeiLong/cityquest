//
//  DetailProtocol.swift
//  cityquest
//
//  Created by Ezequiel Gomes on 25/10/2024.
//

import Foundation
import DeveloperToolsSupport


protocol DetailProtocol {

    var name : String { get }
    var image : ImageResource { get }
    var description : String { get }
   // var places : [Place]? { get }
}