//
//  PedidoRingCard.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 14/9/25.
//

import SwiftUI

struct PedidoRingCard: View {
    let completed: Int
    let total: Int

    var body: some View {
        VStack(spacing: 12) {
            Text("Pedidos")
                .font(.title2.weight(.semibold))
                .foregroundColor(Theme.Colors.primaryText)
                .frame(maxWidth: .infinity, alignment: .leading)

            Divider()
                .background(Theme.Colors.secondaryText.opacity(0.2))

            HStack {
                ActivityRing(progress: CGFloat(completed) / CGFloat(max(1, total)))
                    .frame(width: 100, height: 100)

                Text("\(completed)/\(total)")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(Theme.Colors.pedidoRed)
            }
        }
        .padding()
        .background(
            Theme.Colors.cardBackground,
            in: RoundedRectangle(cornerRadius: 16)
        )
    }
}
