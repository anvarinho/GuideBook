//
//  Pearl.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import Foundation
import SwiftUI

struct Pearl: Codable, Identifiable {
    let id: Int
    let name: String
    let photo: String
    let description: String
    let location: Location
}

struct Pearls: Codable {
    let pearls: [Pearl]
}
