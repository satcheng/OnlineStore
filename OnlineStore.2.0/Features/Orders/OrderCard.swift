//
//  Untitled.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 14/9/25.
//

import SwiftUI

struct OrderCard: View {
    let order: Order

    private var hourFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Nº pedido (12 dígitos)
            Text(order.id)
                .font(.headline)
                .foregroundColor(.white)

            // Estado y hora
            HStack {
                Text(order.status.rawValue)
                    .font(.subheadline)
                    .foregroundColor(.red)

                Spacer()

                Text(hourFormatter.string(from: order.date))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            // Nº de líneas
            Text("Líneas: \(order.lines)")
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}

#Preview {
    OrderCard(
        order: Order(
            id: "000000000123",
            status: .esperandoPicking,
            date: Date(),
            lines: 4
        )
    )
    .padding()
    .background(Color.black)
}
