//
//  ColorsList.swift
//  GuideBookClone (iOS)
//
//  Created by Anvar Jumabaev on 28.08.2021.
//

import SwiftUI

struct ColorsList: View {
    @AppStorage("background") var background = 1
    @EnvironmentObject var vm: ViewModel
    var body: some View {
        ZStack{
            BlurView(style: .systemThinMaterialDark).ignoresSafeArea()
            VStack(spacing: 15){
                Text("Light")
                    .foregroundColor(BackgroundView().getFontColor(num: 0))
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding(.vertical, 5)
                    .frame(width: UIScreen.main.bounds.width * 0.8)
                    .background(BackgroundView().light)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .onTapGesture {
                        background = 0
                        vm.showColors = false
                        vm.showInfo = false
                    }
                
                Text("Dark")
                    .foregroundColor(BackgroundView().getFontColor(num: 1))
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding(.vertical, 5)
                    .frame(width: UIScreen.main.bounds.width * 0.8)
                    .background(BackgroundView().dark)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .onTapGesture {
                        background = 1
                        vm.showColors = false
                        vm.showInfo = false
                    }
                    
                Text("Cream")
                    .foregroundColor(BackgroundView().getFontColor(num: 2))
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding(.vertical, 5)
                    .frame(width: UIScreen.main.bounds.width * 0.8)
                    .background(BackgroundView().cream)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .onTapGesture {
                        background = 2
                        vm.showColors = false
                        vm.showInfo = false
                    }
                
                    
                Text("Ocean")
                    .foregroundColor(BackgroundView().getFontColor(num: 3))
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding(.vertical, 5)
                    .frame(width: UIScreen.main.bounds.width * 0.8)
                    .background(BackgroundView().greenGradient)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .onTapGesture {
                        background = 3
                        vm.showColors = false
                        vm.showInfo = false
                    }
            }
            VStack {
                HStack {
                    Button(action:{
                        vm.showColors = false
                    }, label:{
                        MenuButton(title: "Back", image: "city")
                    })
                    Spacer()
                }.padding(.horizontal)
                Spacer()
            }
        }
    }
}

struct ColorsList_Previews: PreviewProvider {
    static var previews: some View {
        ColorsList()
    }
}
