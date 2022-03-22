//
//  TabButton.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 06.09.2021.
//

import Foundation
import SwiftUI

struct TabButton: View {
    var title: String
    var image: String
    @Binding var selected: String
    var body: some View {
        Button {
            withAnimation(.spring()){ selected = title }
        } label: {
            HStack(spacing: 10){
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)
                if selected == title{
                    Text(title)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                }
            }.padding(.vertical, 5)
            .padding(.horizontal, 8)
            .background(Color.white.opacity(selected == title ? 0.08 : 0))
            .clipShape(RoundedRectangle(cornerRadius: 5))
        }

    }
}
