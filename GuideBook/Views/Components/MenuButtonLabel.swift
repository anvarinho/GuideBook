//
//  MenuButtonLabel.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 05.07.21.
//

import SwiftUI

struct MenuButtonLabel: View {
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
        .frame(width: UIScreen.main.bounds.width * 0.8)
        .background(BlurView(style: .systemThinMaterialDark))
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}
