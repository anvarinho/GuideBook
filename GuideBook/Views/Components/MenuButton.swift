//
//  MenuButton.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 06.09.2021.
//

import SwiftUI

struct MenuButton: View {
    var title: String
    var image: String
    var body: some View {
        HStack(spacing: 10){
            
            Image(image)
                .resizable()
                .renderingMode(.template)
                .frame(width: 25, height: 25)
                .foregroundColor(.white)
                
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                
        }.padding(.vertical, 5)
        .padding(.horizontal, 8)
        .background(BlurView(style: .systemThinMaterialDark))
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}
