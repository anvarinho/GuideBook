//
//  TabBar.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import Foundation
import SwiftUI

struct TabBar: View {
    @Binding var index: Int
    var body: some View{
        HStack(){
            HStack{
                Image(systemName: "building.2.crop.circle").resizable().frame(width: 35, height: 35)
                
                Text(self.index == 0 ? "Cities" : "").fontWeight(.bold).font(.system(size: 14))
            }.padding(15)
            .background(self.index == 0 ? Color.red.opacity(0.8) : Color.clear)
            .clipShape(Capsule())
            .onTapGesture {
                self.index = 0
            }
            HStack{
                ZStack {
                    Image(systemName: "circle").resizable().frame(width: 35, height: 35)
                    Image(systemName: "leaf").resizable().frame(width: 30, height: 30)
                }
                
                Text(self.index == 1 ? "Issyk-Kul" : "").fontWeight(.bold).font(.system(size: 14))
            }.padding(15)
            .background(self.index == 1 ? Color.green : Color.clear)
            .clipShape(Capsule())
            .onTapGesture {
                self.index = 1
            }
            HStack{
                Image(systemName: "star.circle").resizable().frame(width: 35, height: 35)
                
                Text(self.index == 2 ? "Sights" : "").fontWeight(.bold).font(.system(size: 14))
                
            }.padding(15)
            .background(self.index == 2 ? Color.blue : Color.clear)
            .clipShape(Capsule())
            .onTapGesture {
                self.index = 2
            }
            HStack{
                Image(systemName: "ellipsis.circle").resizable().frame(width: 35, height: 35)
                
                Text(self.index == 3 ? "Menu" : "").fontWeight(.bold).font(.system(size: 14))
            }.padding(15)
            .background(self.index == 3 ? Color.orange : Color.clear)
            .clipShape(Capsule())
            .onTapGesture {
                self.index = 3
            }
        }.padding(4)
        //.frame(width: UIScreen.main.bounds.width)
        .background(BackgroundView().opacity(0.8))
        .clipShape(Capsule())
        .animation(.default)
    }
}
