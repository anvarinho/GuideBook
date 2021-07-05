//
//  PearlDescription.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import SwiftUI

struct PearlDescription : View{
    var selectedPearl: Pearl
    @EnvironmentObject var vm: ViewModel
    @Environment(\.presentationMode) var presentationMode
    var text = ""
    var body: some View{
        ZStack{
            BackgroundView()
            ScrollView {
                VStack{
                    
                    Image(selectedPearl.photo)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundColor(.orange))
                        .shadow(color: Color.black.opacity(0.6), radius: 4, x: 4, y: 4)
                    
                    Text(selectedPearl.name.capitalized)
                        .foregroundColor(Color(#colorLiteral(red: 0.9803921569, green: 0.5725490196, blue: 0.1215686275, alpha: 1)))
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .shadow(color: .black, radius: 3, x: 3, y: 3)
                    
                    Text(selectedPearl.description)
                        .padding()
                        .foregroundColor(Color(#colorLiteral(red: 0.9803921569, green: 0.5725490196, blue: 0.1215686275, alpha: 1)))
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .shadow(color: .black, radius: 2, x: 2, y: 2)
                }
            }
            VStack{
                Image(systemName: "chevron.compact.down")
                    .scaleEffect(3)
                    .offset(y: 10)
                    .foregroundColor(.black)
                    .opacity(0.8)
                    .onTapGesture {
                        withAnimation{
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                Spacer()
            }
        }
    }
}
