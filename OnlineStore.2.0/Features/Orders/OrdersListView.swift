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
                OrderCard(order: order)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .navigationTitle("Pedidos")
        .navigationBarTitleDisplayMode(.inline)
    }
}
