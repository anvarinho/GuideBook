//
//  BackgroundView.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import Foundation
import SwiftUI


struct BackgroundView: View {
    @AppStorage("background") var background = 0
    var body: some View{
        getBackground(num: background).ignoresSafeArea()
        
    }
    
    
    func getBackground(num: Int) -> some View{
        switch num {
        case 0:
            return AnyView(light)
        case 1:
            return AnyView(dark)
        case 2:
            return AnyView(cream)
        default:
            return AnyView(greenGradient)
        }
    }
    
    func getFontColor(num: Int) -> Color{
        switch num {
        case 0:
            return .black
        case 1:
            return .white
        case 2:
            return .black
        default:
            return .orange
        }
    }
    var light = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9607843137, green: 0.9411764706, blue: 0.8901960784, alpha: 1)), Color(#colorLiteral(red: 0.6745098039, green: 0.7333333333, blue: 0.4705882353, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
    var dark = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.01176470588, green: 0.1450980392, blue: 0.2235294118, alpha: 1)), Color(#colorLiteral(red: 0.01568627451, green: 0.1647058824, blue: 0.2196078431, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
    var cream = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9529411765, green: 0.8588235294, blue: 0.8117647059, alpha: 1)), Color(#colorLiteral(red: 0.9568627451, green: 0.8352941176, blue: 0.3137254902, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
    var greenGradient = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1098039216, green: 0.462745098, blue: 0.5607843137, alpha: 1)), Color(#colorLiteral(red: 0.01176470588, green: 0.1450980392, blue: 0.2235294118, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
}
