//
//  OrdersListView.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 14/9/25.
//

import SwiftUI

struct OrdersListView: View {
    @ObservedObject var viewModel: DashboardViewModel
    var filterStatus: OrderStatus? = nil
    var filterHour: Int? = nil

    var filteredOrders: [Order] {
        viewModel.orders.filter { order in
            var matches = true
            if let status = filterStatus {
                matches = matches && order.status == status
            }
            if let hour = filterHour {
                let orderHour = Calendar.current.component(.hour, from: order.date)
                matches = matches && orderHour == hour
            }
            return matches
        }
    }

    var body: some View {
        List {
            ForEach(filteredOrders) { order in
                VStack(alignment: .leading, spacing: 8) {
                    Text("Pedido \(order.id)")
                        .font(.headline)

                    Text(order.status.rawValue)
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Text("Líneas: \(order.lines)")
                        .font(.footnote)
                        .foregroundColor(.secondary)

                    Text("Fecha: \(formattedDate(order.date))")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                .padding(8)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
            }
        }
        .navigationTitle("Pedidos")
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        return formatter.string(from: date)
    }
}
