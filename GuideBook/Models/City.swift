//
//  City.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import Foundation
import SwiftUI

struct City: Codable, Identifiable {
    let id: Int
    var offset: CGFloat
    let name: String
    let photo: String
    let title: String
    let description: String
    let location: Location
    let sights: [Sight]
}

struct Cities: Codable {
    let cities: [City]
}

struct Sight: Codable, Identifiable{
    let id: Int
    let name: String
    let photo: String
    let description: String
    let location: Location
}
