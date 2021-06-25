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
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1098039216, green: 0.462745098, blue: 0.5607843137, alpha: 1)), Color(#colorLiteral(red: 0.01176470588, green: 0.1450980392, blue: 0.2235294118, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            VStack {
                ScrollView(.vertical,showsIndicators: false) {
                    VStack {
                        Text("Need Personal Guide?")
                            .foregroundColor(.orange)
                            .padding(.horizontal)
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .shadow(color: .black, radius: 3, x: 3, y: 3)
                        Text(text)
                            .padding()
                            .foregroundColor(.orange)
                            .font(.system(size: 15, weight: .bold, design: .rounded))
                            .multilineTextAlignment(.center)
                            .shadow(color: .black, radius: 2, x: 2, y: 2)
                       // Link("Instagram", destination: URL(string: "https://www.instagram.com/anvarinho/")!)
                        Link(destination: URL(string: "https://www.instagram.com/anvarinho/")!, label: {
                            Text("Instagram")
                                .foregroundColor(.orange)
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .padding(.vertical,4)
                                .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 3).foregroundColor(.orange)
                                )
                                .shadow(color: .black, radius: 3, x: 3, y: 3)
                        }).padding(.horizontal)
                        Link(destination: URL(string: "https://wa.me/996555320426?text=Hello%20I'm%20from%20GuideBook")!, label: {
                            Text("WhatsApp")
                                .foregroundColor(.orange)
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .padding(.vertical,4)
                                .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 3).foregroundColor(.orange)
                                )
                                .shadow(color: .black, radius: 3, x: 3, y: 3)
                        }).padding(.horizontal)
                        Link(destination: URL(string: "tel:+996703040646")!, label: {
                            Text("Phone Number")
                                .foregroundColor(.orange)
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .padding(.vertical,4)
                                .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 3).foregroundColor(.orange)
                                )
                                .shadow(color: .black, radius: 3, x: 3, y: 3)
                        }).padding(.horizontal)
                        
                        Text(text2)
                            .padding()
                            .foregroundColor(.orange)
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

