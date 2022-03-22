//
//  MapsButton.swift
//  GuideBook (iOS)
//
//  Created by Anvar Jumabaev on 01.09.2021.
//

import SwiftUI

struct MapsButton: View {
    var location: Location
    var width = UIScreen.main.bounds.width * 0.92
    var body: some View{
        Link(destination: URL(string: "https://maps.apple.com/?ll=\(location.latitude),\(location.longitude)")!, label: {
            ZStack{
                BlurView(style: .dark)
                HStack{
                    Spacer()
                    Image("map")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .padding(.horizontal)
                }
            }.frame(width: width,height: width / 1.77)
            .cornerRadius(5)
        })
    }
}
