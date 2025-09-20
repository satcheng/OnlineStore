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

    private var reposicionLines: Int {
        order.lines.filter { $0.status == .esperandoReposicion }.count
    }

    private var surtidasLines: Int {
        order.lines.count - reposicionLines
    }

    private var strongLines: Int {
        order.lines.filter {
            $0.status != .esperandoReposicion &&
            OrderStatus.allCases.firstIndex(of: $0.status)! >= thresholdIndex
        }.count
    }

    private var softLines: Int {
        order.lines.count - strongLines - reposicionLines
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Nº pedido + hora
            HStack {
                Text(order.id)
                    .font(.headline)
                    .foregroundColor(.white)

                Spacer()

                Text(hourFormatter.string(from: order.date))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            // Estado
            HStack(spacing: 6) {
                Text(order.status.rawValue)
                    .font(.subheadline)
                    .foregroundColor(.red)
            }

            // 🔹 Estado: esperandoPicking
            if order.status == .esperandoPicking {
                Text("Líneas: \(order.lines.count)")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }

            // 🔹 Estado: enPicking
            if order.status == .enPicking {
                // Contadores
                HStack {
                    Text("Surtidas: \(surtidasLines)")
                        .font(.footnote)

                    if reposicionLines > 0 {
                        Spacer()
                        Text("No encontradas: \(reposicionLines)")
                            .font(.footnote)
                    }
                }

                // Avatar + Barra
                HStack(spacing: 8) {
                    // Avatar círculo con iniciales
                    ZStack {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 24, height: 24)
                        Text(pickerInitials)
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }

                    // Barra de progreso
                    GeometryReader { geometry in
                        HStack(spacing: 0) {
                            Rectangle()
                                .fill(Color.red)
                                .frame(width: geometry.size.width *
                                       CGFloat(strongLines) / CGFloat(max(order.lines.count, 1)))

                            Rectangle()
                                .fill(Color.orange)
                                .frame(width: geometry.size.width *
                                       CGFloat(reposicionLines) / CGFloat(max(order.lines.count, 1)))

                            Rectangle()
                                .fill(Color.red.opacity(0.3))
                                .frame(width: geometry.size.width *
                                       CGFloat(softLines) / CGFloat(max(order.lines.count, 1)))
                        }
                        .cornerRadius(6)
                    }
                    .frame(height: 12)
                }
                .frame(height: 28)
            }
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}
