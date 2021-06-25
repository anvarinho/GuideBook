//
//  ContentView.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var vm: ViewModel
    @State var index = 1
    @State var animate = [false, false, false]
    var body: some View {
        ZStack{
            BackgroundView()
            VStack{
                HStack {
                    Text("Cities".uppercased())
                        .foregroundColor(.orange)
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .scaleEffect(animate[0] ? 1 : 0.3)
                        .offset(x: animate[0] ? 0 : -300)
                    Spacer()
                    Button(action: {
                        withAnimation{
                            vm.showInfo.toggle()
                        }
                    }, label:{
                        Image(systemName: "ellipsis")
                            .foregroundColor(.orange)
                            .scaleEffect(2)
                            .padding(.horizontal)
                    })
                }.padding(.horizontal)
                .shadow(color: .black, radius: 3, x: 3, y: 3)
                
                CitiesListView()
                    .offset(x: animate[0] ? 0 : 500)
                    .opacity(animate[0] ? 1 : 0)
                
                HStack {
                    Text("Issyk-Kul Region".uppercased())
                        .foregroundColor(.orange)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .scaleEffect(animate[1] ? 1 : 0.3)
                        .opacity(animate[1] ? 1 : 0)
                        .offset(x: animate[1] ? 0 : -300)
                    Spacer()
                    
                }.padding(.horizontal)
                .shadow(color: .black, radius: 3, x: 3, y: 3)
                
                IKListView()
                    .offset(x: animate[1] ? 0 : 500)
                    .opacity(animate[1] ? 1 : 0)
                
                HStack{
                    Text("Beautiful places".uppercased())
                        .foregroundColor(.orange)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .scaleEffect(animate[2] ? 1 : 0.3)
                        .opacity(animate[2] ? 1 : 0)
                        .offset(x: animate[2] ? 0 : -300)
                    
                    Spacer()
                    
                }.padding(.horizontal)
                .shadow(color: .black, radius: 3, x: 3, y: 3)
                
                BPlacesView()
                    .offset(x: animate[2] ? 0 : 500)
                    .opacity(animate[2] ? 1 : 0)
            }
            if vm.showInfo{
                MenuView()
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            }
        }.onAppear(perform: animations)
    }
    func animations(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(Animation.spring(response: 0.7, dampingFraction: 1, blendDuration: 0.5)){
                animate[0].toggle()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            withAnimation(Animation.spring(response: 0.7, dampingFraction: 1, blendDuration: 0.6)){
                animate[1].toggle()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            withAnimation(Animation.spring(response: 0.7, dampingFraction: 1, blendDuration: 0.8)){
                animate[2].toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
