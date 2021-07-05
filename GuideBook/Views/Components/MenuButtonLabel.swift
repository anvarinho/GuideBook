//
//  MenuButtonLabel.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 05.07.21.
//

import SwiftUI

struct MenuButtonLabel: View {
    var text: String
    var body: some View {
        Text(text)
            .foregroundColor(Color(#colorLiteral(red: 0.9803921569, green: 0.5725490196, blue: 0.1215686275, alpha: 1)))
            .font(.system(size: 22, weight: .bold, design: .rounded))
            .padding(.vertical,4)
            .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
            .overlay(
                RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 3).foregroundColor(Color(#colorLiteral(red: 0.9803921569, green: 0.5725490196, blue: 0.1215686275, alpha: 1)))
            )
            .shadow(color: .black, radius: 3, x: 3, y: 3)
    }
}
