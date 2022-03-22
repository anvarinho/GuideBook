//
//  ListOfPictures.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 06.09.2021.
//

import SwiftUI

struct ListOfPictures: View {
    var tour: [Picture]
    private let timer = Timer.publish(every: 8, on: .main, in: .common).autoconnect()
    @State private var currentIndex = 0
    var body: some View {
        TabView(selection: $currentIndex){
            ForEach(0..<tour.count) { num in
                Image(tour[num].name)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(Color.black.opacity(0.1))
                    .tag(num)
            }
        }.tabViewStyle(PageTabViewStyle())
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .padding(4)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3.3)
        .onReceive(timer) { _ in
            withAnimation(Animation.spring(response: 1, dampingFraction: 1, blendDuration: 1)) {
                currentIndex = currentIndex < tour.count ? currentIndex + 1 : 0
            }
        }

    }
}
