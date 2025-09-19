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

    // 🔹 Índice de corte: a partir de aquí consideramos "fuerte"
    private var thresholdIndex: Int {
        OrderStatus.allCases.firstIndex(of: .endedPicking)!
    }

    // 🔹 Líneas rojas fuertes (estado ≥ reposición)
    private var strongLines: Int {
        order.lines.filter {
            OrderStatus.allCases.firstIndex(of: $0.status)! >= thresholdIndex
        }.count
    }

    // 🔹 Líneas rojas suaves (estado < reposición)
    private var softLines: Int {
        order.lines.count - strongLines
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Nº pedido
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
            Text("Líneas: \(order.lines.count)")
                .font(.footnote)
                .foregroundColor(.secondary)

            // 🔹 Barra de progreso por líneas
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    // Parte suave
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: geometry.size.width * CGFloat(strongLines) / CGFloat(max(order.lines.count, 1)))

                    // Parte fuerte
                    Rectangle()
                        .fill(Color.red.opacity(0.3))
                        .frame(width: geometry.size.width * CGFloat(softLines) / CGFloat(max(order.lines.count, 1)))
                }
                .cornerRadius(6)
            }
            .frame(height: 12)

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
            date: Date(),
            lines: [
                OrderLine(status: .enPicking),           // suave
                OrderLine(status: .esperandoPicking),    // suave
                OrderLine(status: .esperandoReposicion), // fuerte
                OrderLine(status: .esperandoCliente),    // fuerte
                OrderLine(status: .hecho)                // fuerte
            ]
        )
    )
    .padding()
    .background(Color.black)
}
