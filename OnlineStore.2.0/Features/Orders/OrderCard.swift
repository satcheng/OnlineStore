//
//  Untitled.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 14/9/25.
//

import SwiftUI

struct OrderCard: View {
    let order: Order
    let pickerInitials: String  // 🔹 iniciales del picker asignado

    private var hourFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }

    private var thresholdIndex: Int {
        OrderStatus.allCases.firstIndex(of: .endedPicking)!
    }

    // 🔹 Líneas pendientes de reposición
    private var reposicionLines: Int {
        order.lines.filter { $0.status == .esperandoReposicion }.count
    }

    // 🔹 Líneas surtidas = total - reposición
    private var surtidasLines: Int {
        order.lines.count - reposicionLines
    }

    // 🔹 Líneas fuertes (≥ endedPicking, sin contar reposición)
    private var strongLines: Int {
        order.lines.filter {
            $0.status != .esperandoReposicion &&
            OrderStatus.allCases.firstIndex(of: $0.status)! >= thresholdIndex
        }.count
    }

    // 🔹 Líneas suaves (resto)
    private var softLines: Int {
        order.lines.count - strongLines - reposicionLines
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Nº pedido + hora + avatar picker
            HStack {
                Text(order.id)
                    .font(.headline)
                    .foregroundColor(.white)

                Spacer()

                Text(hourFormatter.string(from: order.date))
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                // 🔹 Avatar círculo con iniciales
                ZStack {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 28, height: 28)
                    Text(pickerInitials)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }

            // Estado
            Text(order.status.rawValue)
                .font(.subheadline)
                .foregroundColor(.red)

            // 🔹 Contadores de surtidas / no encontradas
            HStack {
                Text("Surtidas: \(surtidasLines)")
                    .font(.footnote)

                if reposicionLines > 0 {
                    Spacer()
                    Text("No encontradas: \(reposicionLines)")
                        .font(.footnote)
                }
            }

            // 🔹 Barra SOLO si el pedido está en Picking
            if order.status == .enPicking {
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        // Parte fuerte
                        Rectangle()
                            .fill(Color.red)
                            .frame(width: geometry.size.width *
                                   CGFloat(strongLines) / CGFloat(max(order.lines.count, 1)))

                        // Parte reposición (naranja)
                        Rectangle()
                            .fill(Color.orange)
                            .frame(width: geometry.size.width *
                                   CGFloat(reposicionLines) / CGFloat(max(order.lines.count, 1)))

                        // Parte suave
                        Rectangle()
                            .fill(Color.red.opacity(0.3))
                            .frame(width: geometry.size.width *
                                   CGFloat(softLines) / CGFloat(max(order.lines.count, 1)))
                    }
                    .cornerRadius(6)
                }
                .frame(height: 12)
            }
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}
