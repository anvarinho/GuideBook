//
//  CitiesButtonView.swift
//  GuideBook
//
//  Created by MacBook on 26.01.2022.
//

import SwiftUI

struct CitiesButtonView: View {
    @Binding var place: City?
    var ids: [Int]
    var cities: [City]
    var body: some View {
        ForEach(ids, id: \.self) { id in
            ForEach(cities) { city in
                if city.id == id{
                    Button{
                        place = city
                    } label: {
                        Text("\(city.name)")
                            .font(.system(size: 19, weight: .bold, design: .rounded))
                            .padding(5)
                            .foregroundColor(.primary)
                            .background(BlurView(style: .systemUltraThinMaterialDark))
                            .cornerRadius(5)
                            
                    }
                    
                }
            }
        }
    }
}
