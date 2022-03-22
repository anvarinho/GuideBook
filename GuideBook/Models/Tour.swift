//
//  Tour.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 20.08.2021.
//

import Foundation
import SwiftUI

struct Tours: Codable{
    let tours: [Tour]
}

struct Tour: Codable, Identifiable {
    let id: Int
    let name: String
    let title: String
    let price: String
    let photo: String
    let days: [Day]
}

struct Day: Codable, Identifiable {
    let name: String
    let title: String
    let id: Int
    let photo: [Picture]
    let action: [Action]
    let pearls: [Int]
    let cities: [Int]
}

struct Picture: Codable, Identifiable {
    let id: Int
    let name: String
}

struct Action: Codable, Identifiable {
    let id: Int
    let name: String
}
