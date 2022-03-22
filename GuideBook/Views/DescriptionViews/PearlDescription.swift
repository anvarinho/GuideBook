//
//  PearlDescription.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import SwiftUI

struct PearlDescription : View{
    var selectedPearl: Pearl
    @AppStorage("background") var background = 0
    @EnvironmentObject var vm: ViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var width = UIScreen.main.bounds.width
    var text = ""
    var body: some View{
        ZStack{
            BackgroundView()
            ScrollView {
                VStack{
                    
                    Image(selectedPearl.photo)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: width , height: width / 1.77)
                        .cornerRadius(10)
                    
                    Link(destination: URL(string: "https://maps.apple.com/?ll=\(selectedPearl.location.latitude),\(selectedPearl.location.longitude)")!, label: {
                        MenuButtonLabel(title: "Show on Maps", image: "map")
                    }).padding(.horizontal)
                    
                    Text(selectedPearl.name.capitalized)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(BackgroundView().getFontColor(num: background))
                    
                    Text(selectedPearl.description)
                        .padding()
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .foregroundColor(BackgroundView().getFontColor(num: background))
                }
                ContactButton()
                
                
            }
            DismissButton()
        }
    }
}
