//
//  MenuView.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import Foundation
import SwiftUI

struct MenuView: View {
    @State var animate = [false, false, false, false, false]
    @State var showSheet = false
    @State var showActionSheet = false
    @EnvironmentObject var vm: ViewModel
    
    var isPad: Bool{ return UIDevice.current.userInterfaceIdiom == .pad }
    
    var body: some View {
        ZStack{
            BlurView(style: .systemThinMaterialDark).ignoresSafeArea()
            VStack {
                HStack {
                    if !animate[1]{
                        Spacer()
                    }
                    Button(action:{
                        withAnimation{
                            vm.showInfo.toggle()
                        }
                    }, label:{
                        MenuButton(title:  animate[1] ? "Back" : "Menu", image: animate[1] ? "city" : "menu")
                    })
                    if animate[1]{
                        Spacer()
                    }
                }.padding(.horizontal)
                Spacer()
                VStack(spacing: 15){
                    
                    Button(action: {
                        withAnimation{
                            vm.showMap = true
                        }
                    }, label: {
                        MenuButtonLabel(title:  "Show Maps", image: "maps")
                    }).scaleEffect(animate[0] ? 1 : 0)
                    
                    Button(action: {
                        vm.showColors.toggle()
                    }, label: {
                        MenuButtonLabel(title:  "Color Schemes", image: "colors")
                    }).scaleEffect(animate[1] ? 1 : 0)
                    
                    Button(action: {
                        showSheet.toggle()
                    }, label: {
                        MenuButtonLabel(title:  "How to visit country", image: "visa")
                    }).scaleEffect(animate[2] ? 1 : 0)
                    
                    Button(action: {
                        isPad ? UIApplication.shared.open(URL(string: "https://www.instagram.com/guidebook_kyrgyzstan/")!) : showActionSheet.toggle()
                    }, label: {
                        MenuButtonLabel(title: isPad ? "Need Guide? Contact us:" : "Need Personal Guide?", image: "guide")
                    }).scaleEffect(animate[3] ? 1 : 0)
                    
                    Link(destination: URL(string: "https://sites.google.com/view/guidebook-kyrgyzstan/")!, label: {
                        MenuButtonLabel(title: "Privacy Policy", image: "privacy")
                    }).padding(.horizontal)
                    .scaleEffect(animate[4] ? 1 : 0)
                }
                Spacer()
                Spacer()
            }
            if vm.showColors{
                ColorsList()
            }
        }.onAppear{ animations() }
        .sheet(isPresented: $showSheet, content: {
            AboutVisa()
        })
        .actionSheet(isPresented: $showActionSheet, content: actionSheet)
    }
    func animations(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(Animation.spring(response: 0.7, dampingFraction: 1, blendDuration: 0.1)){
                animate[0].toggle()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation(Animation.spring(response: 0.7, dampingFraction: 1, blendDuration: 0.2)){
                animate[1].toggle()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(Animation.spring(response: 0.7, dampingFraction: 1, blendDuration: 0.3)){
                animate[2].toggle()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(Animation.spring(response: 0.7, dampingFraction: 1, blendDuration: 0.4)){
                animate[3].toggle()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(Animation.spring(response: 0.7, dampingFraction: 1, blendDuration: 0.5)){
                animate[4].toggle()
            }
        }
    }
    
    func actionSheet() -> ActionSheet{
        return ActionSheet(title: Text("Are you going to visit Kyrgyzstan?"), message: Text("If you are, I can meet you at Manas airport, supply you with local active sim card with unlimited access to the internet, help you with efficient changing any currency to soms(local currency), you don't have to book hotel in advance, create a route by your wishes and try to make you to remember your journey for a long time. Just don't hesitate to contact me, by my contacts below ↓ \n\nIf you have any questions or special preferences, as well, you know where are my contacts :"), buttons: [
            .default(Text("By Instagram")) { UIApplication.shared.open(URL(string: "https://www.instagram.com/centralasia.guides/")!)},
            .default(Text("By WhatsApp")){ UIApplication.shared.open(URL(string: "https://wa.me/996707240807?text=Hello%20I'm%20from%20GuideBook")!)},
            .default(Text("By Email")) { UIApplication.shared.open(URL(string: "mailto:centralasia.guides@gmail.com?subject=Tour%20Order&body=Hello%20I'm%20from%20GuideBook")!)},
            .cancel()
        ])
    }
    
}
