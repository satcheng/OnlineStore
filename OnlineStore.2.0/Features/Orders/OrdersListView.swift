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

    // 🔹 Lista de pickers (ejemplo)
    private let pickers = PickerService.samplePickers()

    private var filteredOrders: [Order] {
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
                if let picker = pickers.first(where: { $0.assignedOrders.contains(order.id) }) {
                    // Pedido con picker asignado
                    OrderCard(order: order, pickerInitials: picker.initials)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                } else {
                    // Pedido sin asignar → círculo vacío
                    OrderCard(order: order, pickerInitials: "")
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                }
            }
        }
        .listStyle(PlainListStyle())
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .navigationTitle("Pedidos")
        .navigationBarTitleDisplayMode(.inline)
    }
}

