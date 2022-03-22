//
//  NeedGuide.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import Foundation
import SwiftUI

struct NeedGuide: View {
    var text = """
    Contact us
    """
    var text2 = """
    """
    
    @EnvironmentObject var vm: ViewModel
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                ScrollView(.vertical,showsIndicators: false) {
                    VStack {
                        Text("Need Personal Guide?")
                            .foregroundColor(Color(#colorLiteral(red: 0.9803921569, green: 0.5725490196, blue: 0.1215686275, alpha: 1)))
                            .padding(.horizontal)
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .shadow(color: .black, radius: 3, x: 3, y: 3)
                        Text(text)
                            .padding()
                            .foregroundColor(Color(#colorLiteral(red: 0.9803921569, green: 0.5725490196, blue: 0.1215686275, alpha: 1)))
                            .font(.system(size: 15, weight: .bold, design: .rounded))
                            .multilineTextAlignment(.center)
                            .shadow(color: .black, radius: 2, x: 2, y: 2)
                        
                       // Link("Instagram", destination: URL(string: "https://www.instagram.com/anvarinho/")!)
                        
                        Link(destination: URL(string: "https://www.instagram.com/anvarinho/")!, label: {
                            MenuButtonLabel(title: "Instagram", image: "instagram")
                        }).padding(.horizontal)
                        
                        Link(destination: URL(string: "https://wa.me/996555320426?text=Hello%20I'm%20from%20GuideBook")!, label: {
                            MenuButtonLabel(title: "WhatsApp", image: "whatsapp")
                        }).padding(.horizontal)
                        
                        Link(destination: URL(string: "tel:+996703040646")!, label: {
                            MenuButtonLabel(title: "Phone", image: "phone")
                        }).padding(.horizontal)
                        
                        Text(text2)
                            .padding()
                            .foregroundColor(Color(#colorLiteral(red: 0.9803921569, green: 0.5725490196, blue: 0.1215686275, alpha: 1)))
                            .font(.system(size: 15, weight: .bold, design: .rounded))
                            .multilineTextAlignment(.leading)
                            .shadow(color: .black, radius: 2, x: 2, y: 2)
                    }
                }
            }
            .onTapGesture {
                withAnimation{
                    vm.showGuideView.toggle()
                }
            }
        }
    }
}

