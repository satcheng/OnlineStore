//
//  DashboardViewModel.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 14/9/25.
//

import Foundation

final class DashboardViewModel: ObservableObject {
    @Published var orders: [Order] = OrderService.sampleOrders()

    // Conteo por estado
    func count(for status: OrderStatus) -> Int {
        orders.filter { $0.status == status }.count
    }

    var total: Int {
        orders.count
    }

    // Datos horarios para la gráfica
    var hourlyData: [HourlyData] {
        let cal = Calendar.current
        let grouped = Dictionary(grouping: orders) { order in
            cal.component(.hour, from: order.date)
        }

        return (10...20).map { hour in
            let bucket = grouped[hour] ?? []
            let total = bucket.count
            let completed = bucket.filter { $0.status == .hecho }.count
            return HourlyData(hour: hour, total: total, completed: completed)
        }
    }
}
