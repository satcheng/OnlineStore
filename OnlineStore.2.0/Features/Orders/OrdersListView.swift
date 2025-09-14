//
//  OrdersListView.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 14/9/25.
//

import SwiftUI

struct OrdersListView: View {
    let orders: [Order]
    var hourFilter: Int? = nil

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(filteredOrders) { order in
                    OrderRow(order: order)
                }
            }
            .padding()
        }
        .navigationTitle("Pedidos")
        .background(Color.black.ignoresSafeArea())
    }

    private var filteredOrders: [Order] {
        if let hour = hourFilter {
            return orders.filter {
                Calendar.current.component(.hour, from: $0.date) == hour
            }
        }
        return orders
    }
}

struct OrderRow: View {
    let order: Order

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Pedido #\(order.id)")
                .font(.headline)
                .foregroundColor(.white)

            Text("Estado: \(order.status.rawValue.capitalized)")
                .font(.subheadline)
                .foregroundColor(.gray)

            Text("Líneas: \(order.lines.count)")
                .font(.subheadline)
                .foregroundColor(.gray)

            Text("Fecha: \(order.date.formatted(date: .abbreviated, time: .shortened))")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Theme.Colors.cardBackground)
        .cornerRadius(12)
    }
}
