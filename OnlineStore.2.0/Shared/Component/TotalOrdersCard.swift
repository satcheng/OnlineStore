//
//  TotalOrdersCard.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 14/9/25.
//

import SwiftUI

struct TotalOrdersCard: View {
    let totalOrders: Int
    let completedOrders: Int
    let totalLines: Int
    let completedLines: Int

    // 👉 Progreso pedidos
    private var ordersProgress: Double {
        guard totalOrders > 0 else { return 0 }
        return Double(completedOrders) / Double(totalOrders)
    }

    private var ordersPercentageText: String {
        guard totalOrders > 0 else { return "0%" }
        let percent = Int(ordersProgress * 100)
        return "\(percent)%"
    }

    // 👉 Progreso líneas
    private var linesProgress: Double {
        guard totalLines > 0 else { return 0 }
        return Double(completedLines) / Double(totalLines)
    }

    private var linesPercentageText: String {
        guard totalLines > 0 else { return "0%" }
        let percent = Int(linesProgress * 100)
        return "\(percent)%"
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // 🔹 Bloque pedidos
            VStack(alignment: .leading, spacing: 8) {

                HStack {
                    
                    Text("Pedidos")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Text("\(completedOrders)/\(totalOrders) | ")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(ordersPercentageText)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.red.opacity(0.2))
                            .frame(height: 10)

                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.red)
                            .frame(width: geometry.size.width * ordersProgress,
                                   height: 10)
                    }
                }
                .frame(height: 10)
            }

            // 🔹 Bloque líneas
            VStack(alignment: .leading, spacing: 8) {

                HStack {
                    
                    Text("Lineas")
                        .font(.headline)
                        .foregroundColor(.primary)

                    Spacer()
                    
                    Text("\(completedLines)/\(totalLines) | ")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(linesPercentageText)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.red.opacity(0.2))
                            .frame(height: 10)

                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.red)
                            .frame(width: geometry.size.width * linesProgress,
                                   height: 10)
                    }
                }
                .frame(height: 10)
            }
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
    }
}
