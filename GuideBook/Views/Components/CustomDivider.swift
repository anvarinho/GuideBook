//
//  CustomDivider.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 06.09.2021.
//

import SwiftUI

struct CustomDivider: View {
    let height: CGFloat = 2
    let color: Color = .white
    let opacity = 0.2
    var body: some View{
        Group{
            Rectangle()
        }
        .frame(height: height)
        .foregroundColor(color)
        .opacity(opacity)
    }
}
