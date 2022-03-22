//
//  BishkekTime.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 05.07.21.
//

import SwiftUI

struct BishkekTime: View {
    @State var animate = false
    @State var timeNow = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "KGT")
        formatter.dateFormat = "hh:mm a"
        return formatter
    }
    
    var body: some View {
        Text(timeNow.lowercased())
            .foregroundColor(.white)
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .frame(height: 25)
            .padding(.vertical, 5)
            .padding(.horizontal, 8)
            .background(BlurView(style: .systemThinMaterialDark))
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .offset(y: animate ? 0 : -100)
            .onReceive(timer) { _ in
                self.timeNow = dateFormatter.string(from: Date())
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation(Animation.spring(response: 0.7, dampingFraction: 1, blendDuration: 0.8)){
                        animate = true
                    }
                }
            }
    }
}
