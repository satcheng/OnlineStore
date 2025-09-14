//
//  DashboardViewModel.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 14/9/25.
//

import SwiftUI

class DashboardViewModel: ObservableObject {
    @Published var orders: [Order] = []
    @Published var hourlyData: [HourlyData] = []
    @Published var centerCode: String = "123"

    var totalOrders: Int { orders.count }
    var completedOrders: Int { orders.filter { $0.status == .completed }.count }
    var pendingOrders: Int { orders.filter { $0.status == .pending }.count }
    var inProgressOrders: Int { orders.filter { $0.status == .inProgress }.count }
    var avgTime: Int { 11 } // mock

    init() {
        self.orders = OrderService.sample
        self.hourlyData = DashboardViewModel.buildHourlyData(orders: orders)
    }

    static func buildHourlyData(orders: [Order]) -> [HourlyData] {
        let hours = Array(10...20)
        return hours.map { hour in
            let filtered = orders.filter {
                Calendar.current.component(.hour, from: $0.date) == hour
            }
            let total = filtered.count
            let completed = filtered.filter { $0.status == .completed }.count
            return HourlyData(hour: hour, total: total, completed: completed)
        }
    }
}

struct HourlyData: Identifiable {
    let id = UUID()
    let hour: Int
    let total: Int
    let completed: Int
}
