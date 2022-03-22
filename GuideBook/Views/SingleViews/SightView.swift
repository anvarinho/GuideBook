//
//  SightView.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 02.02.2022.
//

import SwiftUI

struct SightView: View {
    var sight: Sight
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            TextAnimation(word: sight.name)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .padding(.horizontal)
                .padding(.top)
            Text(sight.description)
                .font(.system(size: 15, weight: .bold, design: .rounded))
                .padding()
        }
    }
}
