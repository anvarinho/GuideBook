//
//  NameTexts.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 05.07.21.
//

import SwiftUI

struct NameText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .foregroundColor(Color(#colorLiteral(red: 0.9803921569, green: 0.5725490196, blue: 0.1215686275, alpha: 1)))
            .font(.system(size: text == "Cities" ? 26 : 24, weight: .bold, design: .rounded))
    }
}

