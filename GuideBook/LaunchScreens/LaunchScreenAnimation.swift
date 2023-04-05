//
//  LaunchScreenAnimation.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 21.06.21.
//

import SwiftUI

struct LaunchScreenAnimation: View {
    @State var animate = false
    @State var endAnimation = false
    var body: some View {
        ZStack{
            TabBar()
            ZStack{
                Color(#colorLiteral(red: 1, green: 0.1607843137, blue: 0.1607843137, alpha: 1))
                
                Image("logo")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 100, height: animate ? nil : 100)
                    .scaleEffect(animate ? 3 : 1)
                    .frame(width: UIScreen.main.bounds.width)
            }
            .ignoresSafeArea()
            .onAppear(perform: animateFlag)
            .opacity(endAnimation ? 0 : 1)
        }
    }
    func animateFlag(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            withAnimation(Animation.easeOut(duration: 0.5)){
                animate.toggle()
            }
            withAnimation(Animation.easeOut(duration: 0.4)){
                endAnimation.toggle()
            }
        }
    }
}
