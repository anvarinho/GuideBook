//
//  TourActionsView.swift
//  GuideBook
//
//  Created by MacBook on 26.01.2022.
//

import SwiftUI

struct TourActionsView: View {
    var actions: [Action]
    var body: some View {
        ForEach(actions){ action in
            Text("\(action.name).")
                .font(.system(size: 16, weight: .bold, design: .rounded))
        }
    }
}
