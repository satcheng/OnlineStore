//
//  ActivityRing.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 14/9/25.
//

import SwiftUI

struct ActivityRing: View {
    let progress: CGFloat

    var body: some View {
        ZStack {
            Circle()
                .stroke(Theme.Colors.pedidoRed.opacity(0.3), lineWidth: 12)

            Circle()
                .trim(from: 0, to: progress)
                .stroke(Theme.Colors.pedidoRed, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
    }
}
