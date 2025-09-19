//
//  OrderService.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 14/9/25.
//

import Foundation

struct OrderService {
    static func sampleOrders() -> [Order] {
        var orders: [Order] = []
        let calendar = Calendar.current
        let baseDate = Date()
        var idCounter = 1

        func makeOrder(hour: Int, lineStatuses: [OrderStatus]) -> Order {
            let date = calendar.date(bySettingHour: hour, minute: 0, second: 0, of: baseDate)!
            let orderLines = lineStatuses.map { OrderLine(status: $0) }

            let order = Order(
                id: String(format: "%012d", idCounter),
                date: date,
                lines: orderLines
            )

            idCounter += 1
            return order
        }

        // 🔹 50 pedidos definidos con arrays de estados
        orders.append(contentsOf: [
            makeOrder(hour: 10, lineStatuses: [.hecho, .hecho, .hecho]),
            makeOrder(hour: 10, lineStatuses: [.hecho, .hecho]),
            makeOrder(hour: 10, lineStatuses: [.hecho, .hecho, .hecho, .hecho, .hecho]),
            makeOrder(hour: 10, lineStatuses: [.hecho, .hecho, .hecho, .hecho]),
            makeOrder(hour: 11, lineStatuses: [.hecho, .hecho, .hecho, .hecho]),
            makeOrder(hour: 11, lineStatuses: [.hecho, .hecho, .hecho]),
            makeOrder(hour: 11, lineStatuses: [.hecho, .hecho, .hecho, .hecho, .hecho, .hecho]),
            makeOrder(hour: 11, lineStatuses: [.hecho, .hecho]),
            makeOrder(hour: 11, lineStatuses: [.hecho, .hecho, .hecho, .hecho]),
            makeOrder(hour: 11, lineStatuses: [.hecho, .hecho, .hecho, .hecho, .hecho]),
            makeOrder(hour: 12, lineStatuses: [.hecho, .hecho, .hecho]),
            makeOrder(hour: 12, lineStatuses: [.hecho, .hecho, .hecho, .hecho]),
            makeOrder(hour: 12, lineStatuses: [.hecho, .hecho]),
            makeOrder(hour: 12, lineStatuses: [.hecho, .hecho, .hecho, .hecho, .hecho]),
            makeOrder(hour: 12, lineStatuses: [.hecho, .hecho, .hecho]),
            makeOrder(hour: 13, lineStatuses: [.hecho, .hecho, .hecho, .hecho]),
            makeOrder(hour: 13, lineStatuses: [.enPacking, .enPacking, .enPacking]),
            makeOrder(hour: 13, lineStatuses: [.enPacking, .enPacking]),
            makeOrder(hour: 13, lineStatuses: [.esperandoPacking]),
            makeOrder(hour: 13, lineStatuses: [.esperandoPacking, .esperandoPacking, .esperandoPacking]),
            makeOrder(hour: 13, lineStatuses: [.enPicking, .enPicking, .endedPicking]),
            makeOrder(hour: 14, lineStatuses: [.enPicking, .endedPicking]),
            makeOrder(hour: 14, lineStatuses: [.enPicking, .enPicking, .endedPicking, .endedPicking]),
            makeOrder(hour: 14, lineStatuses: [.enPicking, .enPicking, .endedPicking]),
            makeOrder(hour: 14, lineStatuses: [.enPicking]),
            makeOrder(hour: 15, lineStatuses: [.endedPicking, .esperandoCliente]),
            makeOrder(hour: 15, lineStatuses: [.esperandoReposicion, .endedPicking, .endedPicking]),
            makeOrder(hour: 15, lineStatuses: [.esperandoCliente, .esperandoCliente, .esperandoCliente]),
            makeOrder(hour: 16, lineStatuses: [.esperandoPicking, .esperandoPicking, .esperandoPicking]),
            makeOrder(hour: 16, lineStatuses: [.esperandoPicking, .esperandoPicking]),
            makeOrder(hour: 16, lineStatuses: [.esperandoPicking, .esperandoPicking, .esperandoPicking, .esperandoPicking]),
            makeOrder(hour: 17, lineStatuses: [.esperandoPicking, .esperandoPicking, .esperandoPicking]),
            makeOrder(hour: 17, lineStatuses: [.esperandoPicking, .esperandoPicking, .esperandoPicking, .esperandoPicking]),
            makeOrder(hour: 17, lineStatuses: [.esperandoPicking, .esperandoPicking, .esperandoPicking, .esperandoPicking, .esperandoPicking]),
            makeOrder(hour: 17, lineStatuses: [.esperandoPicking, .esperandoPicking]),
            makeOrder(hour: 17, lineStatuses: [.esperandoPicking, .esperandoPicking, .esperandoPicking]),
            makeOrder(hour: 18, lineStatuses: [.esperandoPicking, .esperandoPicking, .esperandoPicking]),
            makeOrder(hour: 18, lineStatuses: [.esperandoPicking, .esperandoPicking, .esperandoPicking, .esperandoPicking]),
            makeOrder(hour: 18, lineStatuses: [.esperandoPicking, .esperandoPicking]),
            makeOrder(hour: 18, lineStatuses: [.esperandoPicking, .esperandoPicking, .esperandoPicking]),
            makeOrder(hour: 18, lineStatuses: [.esperandoPicking, .esperandoPicking]),
            makeOrder(hour: 18, lineStatuses: [.esperandoPicking, .esperandoPicking, .esperandoPicking, .esperandoPicking]),
            makeOrder(hour: 18, lineStatuses: [.esperandoPicking, .esperandoPicking]),
            makeOrder(hour: 19, lineStatuses: [.esperandoPicking, .esperandoPicking]),
            makeOrder(hour: 19, lineStatuses: [.esperandoPicking, .esperandoPicking, .esperandoPicking]),
            makeOrder(hour: 19, lineStatuses: [.esperandoPicking]),
            makeOrder(hour: 19, lineStatuses: [.esperandoPicking, .esperandoPicking]),
            makeOrder(hour: 19, lineStatuses: [.esperandoPicking, .esperandoPicking, .esperandoPicking]),
            makeOrder(hour: 20, lineStatuses: [.esperandoPicking, .esperandoPicking]),
            makeOrder(hour: 20, lineStatuses: [.esperandoPicking])
        ])

        return orders
    }
}
