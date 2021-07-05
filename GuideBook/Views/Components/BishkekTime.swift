//
//  BishkekTime.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 05.07.21.
//

import SwiftUI

struct BishkekTime: View {
    @State var timeNow = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "KGT")
        formatter.dateFormat = "hh:mm a"
        return formatter
    }
    
    var body: some View {
        Text(timeNow)
            .onReceive(timer) { _ in
                self.timeNow = dateFormatter.string(from: Date())
            }
    }
    
}


struct BishkekTime_Previews: PreviewProvider {
    static var previews: some View {
        BishkekTime()
    }
}
