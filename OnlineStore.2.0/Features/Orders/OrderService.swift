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

        func makeOrder(hour: Int, status: OrderStatus, lines: Int) -> Order {
            let date = calendar.date(bySettingHour: hour, minute: 0, second: 0, of: baseDate)!
            let order = Order(
                id: String(format: "%012d", idCounter),
                status: status,
                date: date,
                lines: lines
            )
            idCounter += 1
            return order
        }

        // 10h – 12h: mayoría hechos
        orders.append(contentsOf: [
            makeOrder(hour: 10, status: .hecho, lines: 3),
            makeOrder(hour: 10, status: .hecho, lines: 2),
            makeOrder(hour: 10, status: .hecho, lines: 25),
            makeOrder(hour: 10, status: .hecho, lines: 24),
            makeOrder(hour: 11, status: .hecho, lines: 4),
            makeOrder(hour: 11, status: .hecho, lines: 5),
            makeOrder(hour: 11, status: .hecho, lines: 12),
            makeOrder(hour: 11, status: .hecho, lines: 15),
            makeOrder(hour: 11, status: .hecho, lines: 6),
            makeOrder(hour: 11, status: .hecho, lines: 2),
            makeOrder(hour: 12, status: .hecho, lines: 3),
            makeOrder(hour: 12, status: .hecho, lines: 4),
            makeOrder(hour: 12, status: .hecho, lines: 6),
            makeOrder(hour: 12, status: .hecho, lines: 3),
            makeOrder(hour: 12, status: .hecho, lines: 3),
            makeOrder(hour: 13, status: .hecho, lines: 4),
            makeOrder(hour: 13, status: .enPacking, lines: 6),
            makeOrder(hour: 13, status: .enPacking, lines: 2),
            makeOrder(hour: 13, status: .esperandoPacking, lines: 1),
            makeOrder(hour: 13, status: .esperandoPacking, lines: 4),
            makeOrder(hour: 13, status: .enPicking, lines: 3),
            makeOrder(hour: 14, status: .enPicking, lines: 2),
            makeOrder(hour: 14, status: .enPicking, lines: 5),
            makeOrder(hour: 14, status: .enPicking, lines: 3),
            makeOrder(hour: 14, status: .enPicking, lines: 1),
            makeOrder(hour: 15, status: .esperandoCliente, lines: 2),
            makeOrder(hour: 15, status: .esperandoReposicion, lines: 3),
            makeOrder(hour: 15, status: .esperandoCliente, lines: 4),
            makeOrder(hour: 16, status: .esperandoPicking, lines: 3),
            makeOrder(hour: 16, status: .esperandoPicking, lines: 2),
            makeOrder(hour: 16, status: .esperandoPicking, lines: 5),
            makeOrder(hour: 17, status: .esperandoPicking, lines: 3),
            makeOrder(hour: 17, status: .esperandoPicking, lines: 4),
            makeOrder(hour: 17, status: .esperandoPicking, lines: 6),
            makeOrder(hour: 17, status: .esperandoPicking, lines: 3),
            makeOrder(hour: 17, status: .esperandoPicking, lines: 4),
            makeOrder(hour: 18, status: .esperandoPicking, lines: 6),
            makeOrder(hour: 18, status: .esperandoPicking, lines: 4),
            makeOrder(hour: 18, status: .esperandoPicking, lines: 3),
            makeOrder(hour: 18, status: .esperandoPicking, lines: 2),
            makeOrder(hour: 18, status: .esperandoPicking, lines: 2),
            makeOrder(hour: 18, status: .esperandoPicking, lines: 2),
            makeOrder(hour: 18, status: .esperandoPicking, lines: 3),
            makeOrder(hour: 19, status: .esperandoPicking, lines: 2),
            makeOrder(hour: 19, status: .esperandoPicking, lines: 4),
            makeOrder(hour: 19, status: .esperandoPicking, lines: 2),
            makeOrder(hour: 19, status: .esperandoPicking, lines: 3),
            makeOrder(hour: 19, status: .esperandoPicking, lines: 4),
            makeOrder(hour: 19, status: .esperandoPicking, lines: 1),
            makeOrder(hour: 20, status: .esperandoPicking, lines: 4),
            makeOrder(hour: 20, status: .esperandoPicking, lines: 1)

        ])

        // Aseguramos 50 pedidos exactos (rellenamos si falta)
        while orders.count < 50 {
            orders.append(makeOrder(hour: 20, status: .esperandoPacking, lines: 2))
        }

        return orders
    }
}
