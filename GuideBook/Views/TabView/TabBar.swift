//
//  TabBar.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import Foundation
import SwiftUI

struct TabBar: View {
    @State var current = "Tours"
    @State var animate = false
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            TabView(selection: $current) {
                PearlsListView()
                    .tag("Sights")
                ToursListView()
                    .tag("Tours")
                CitiesListView()
                    .tag("Cities")
            }
            
            HStack(spacing: 10){
                TabButton(title: "Sights", image: "sight", selected: $current)
                Spacer(minLength: 0)
                TabButton(title: "Tours", image: "tour", selected: $current)
                Spacer(minLength: 0)
                TabButton(title: "Cities", image: "city", selected: $current)
            }.padding(.vertical,5)
            .padding(.horizontal, 8)
            //.background(Color.orange)
            .background(BlurView(style: .systemThinMaterialDark))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.horizontal,50)
            .padding(.vertical,5)
            .scaleEffect(animate ? 1 : 0.3)
            .offset(y: animate ? 0 : 100)
        }.onAppear{
            withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 1)){
                animate = true
            }
        }
    }

}
