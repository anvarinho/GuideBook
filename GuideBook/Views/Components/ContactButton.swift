//
//  ContactButton.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 06.09.2021.
//

import SwiftUI

struct ContactButton: View {
    @AppStorage("background") var background = 0
    var body: some View{
        VStack{
            Text("Contact Us:")
                .foregroundColor(BackgroundView().getFontColor(num: background))
                .font(.system(size: 19, weight: .bold, design: .rounded))
            
            Link(destination: URL(string: "https://wa.me/996707240807?text=Hello%20I'm%20from%20GuideBook")!, label: {
                MenuButtonLabel(title: "WhatsApp", image: "whatsapp")
            }).padding(.horizontal)
            
            Link(destination: URL(string: "https://www.instagram.com/centralasia.guides/")!, label: {
                MenuButtonLabel(title: "Instagram", image: "instagram")
            }).padding(.horizontal)
            
            Link(destination: URL(string: "mailto:centralasia.guides@gmail.com?subject=Tour%20Order&body=Hello%20I'm%20from%20GuideBook")!, label: {
                MenuButtonLabel(title: "Email", image: "mail")
            }).padding(.horizontal)
        }
    }
}
