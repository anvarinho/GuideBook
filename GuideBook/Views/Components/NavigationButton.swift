//
//  ButtonView.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 05.07.21.
//

import SwiftUI

struct NavigationButton: View {
    var text: String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color(#colorLiteral(red: 0.9803921569, green: 0.5725490196, blue: 0.1215686275, alpha: 1)), lineWidth: 3)
                .frame(width: 65, height: 26)
            Text(text)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(Color(#colorLiteral(red: 0.9803921569, green: 0.5725490196, blue: 0.1215686275, alpha: 1)))
        }
    }
}
