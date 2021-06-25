//
//  Location.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import Foundation
import MapKit

struct Location: Codable{
    let latitude: Double
    let longitude: Double
}

struct Place: Identifiable {
    let id = UUID().uuidString
    let place: CLPlacemark
}
