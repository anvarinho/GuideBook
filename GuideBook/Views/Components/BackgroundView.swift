//
//  BackgroundView.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import Foundation
import SwiftUI

struct BackgroundView: View {
    var body: some View{
        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1098039216, green: 0.462745098, blue: 0.5607843137, alpha: 1)), Color(#colorLiteral(red: 0.01176470588, green: 0.1450980392, blue: 0.2235294118, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
    }
}
