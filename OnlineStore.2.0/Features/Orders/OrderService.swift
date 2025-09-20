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

        func makeOrder(hour: Int,
                       type: DeliveryType,
                       lineStatuses: [OrderStatus]) -> Order {
            let date = calendar.date(bySettingHour: hour, minute: 0, second: 0, of: baseDate)!
            let order = Order(
                id: String(format: "%012d", idCounter),
                date: date,
                lines: lineStatuses.map { OrderLine(status: $0) },
                deliveryType: type
            )
            idCounter += 1
            return order
        }

        // 🔹 Pedidos generados a partir de la tabla

        orders.append(makeOrder(hour: 10, type: .envio,
            lineStatuses: Array(repeating: .hecho, count: 30)
        ))
        orders.append(makeOrder(hour: 10, type: .recogida,
            lineStatuses: Array(repeating: .hecho, count: 22)
        ))
        orders.append(makeOrder(hour: 10, type: .recogida,
            lineStatuses: Array(repeating: .hecho, count: 15)
        ))
        orders.append(makeOrder(hour: 11, type: .envio,
            lineStatuses: Array(repeating: .hecho, count: 23)
        ))
        orders.append(makeOrder(hour: 11, type: .recogida,
            lineStatuses: Array(repeating: .hecho, count: 12)
        ))
        orders.append(makeOrder(hour: 11, type: .recogida,
            lineStatuses: Array(repeating: .hecho, count: 46)
        ))
        orders.append(makeOrder(hour: 11, type: .recogida,
            lineStatuses: Array(repeating: .hecho, count: 13)
        ))
        orders.append(makeOrder(hour: 11, type: .envio,
            lineStatuses: Array(repeating: .hecho, count: 32)
        ))
        orders.append(makeOrder(hour: 12, type: .envio,
            lineStatuses: Array(repeating: .hecho, count: 10)
        ))
        orders.append(makeOrder(hour: 12, type: .envio,
            lineStatuses: Array(repeating: .hecho, count: 41)
        ))
        orders.append(makeOrder(hour: 12, type: .envio,
            lineStatuses: Array(repeating: .hecho, count: 11)
        ))
        orders.append(makeOrder(hour: 12, type: .recogida,
            lineStatuses: Array(repeating: .hecho, count: 8)
        ))
        orders.append(makeOrder(hour: 12, type: .recogida,
            lineStatuses: Array(repeating: .hecho, count: 22)
        ))
        orders.append(makeOrder(hour: 12, type: .envio,
            lineStatuses: Array(repeating: .hecho, count: 12)
        ))
        orders.append(makeOrder(hour: 12, type: .envio,
            lineStatuses: Array(repeating: .hecho, count: 22)
        ))
        orders.append(makeOrder(hour: 13, type: .envio,
            lineStatuses: Array(repeating: .esperandoReposicion, count: 1) +
                          Array(repeating: .esperandoCliente, count: 2) +
                          Array(repeating: .hecho, count: 21)
        ))
        orders.append(makeOrder(hour: 13, type: .envio,
            lineStatuses: Array(repeating: .esperandoPicking, count: 3) +
                          Array(repeating: .hecho, count: 12)
        ))
        orders.append(makeOrder(hour: 13, type: .recogida,
            lineStatuses: Array(repeating: .esperandoCliente, count: 2) +
                          Array(repeating: .hecho, count: 10)
        ))
        orders.append(makeOrder(hour: 13, type: .envio,
            lineStatuses: Array(repeating: .enPicking, count: 23) +
                          Array(repeating: .endedPicking, count: 12) +
                          Array(repeating: .esperandoReposicion, count: 1) +
                          Array(repeating: .hecho, count: 41)
        ))
        orders.append(makeOrder(hour: 14, type: .envio,
            lineStatuses: Array(repeating: .enPicking, count: 27) +
                          Array(repeating: .endedPicking, count: 15) +
                          Array(repeating: .esperandoReposicion, count: 2)
        ))
        orders.append(makeOrder(hour: 14, type: .recogida,
            lineStatuses: Array(repeating: .esperandoPicking, count: 12) +
                          Array(repeating: .enPicking, count: 31) +
                          Array(repeating: .esperandoReposicion, count: 1)
        ))
        orders.append(makeOrder(hour: 14, type: .recogida,
            lineStatuses: Array(repeating: .endedPicking, count: 10) +
                          Array(repeating: .enPicking, count: 22)
        ))
        orders.append(makeOrder(hour: 15, type: .envio,
            lineStatuses: Array(repeating: .endedPicking, count: 32) +
                          Array(repeating: .enPicking, count: 6) +
                          Array(repeating: .esperandoReposicion, count: 3)
        ))
        orders.append(makeOrder(hour: 15, type: .envio,
            lineStatuses: Array(repeating: .endedPicking, count: 32) +
                                Array(repeating: .enPicking, count: 6)
        ))
        orders.append(makeOrder(hour: 15, type: .recogida,
            lineStatuses: Array(repeating: .esperandoPicking, count: 38)
        ))
        orders.append(makeOrder(hour: 15, type: .envio,
            lineStatuses: Array(repeating: .esperandoPicking, count: 35)
        ))
        orders.append(makeOrder(hour: 16, type: .envio,
            lineStatuses: Array(repeating: .esperandoPicking, count: 22)
        ))
        orders.append(makeOrder(hour: 16, type: .recogida,
            lineStatuses: Array(repeating: .esperandoPicking, count: 3)
        ))
        orders.append(makeOrder(hour: 16, type: .envio,
            lineStatuses: Array(repeating: .esperandoPicking, count: 40)
        ))
        orders.append(makeOrder(hour: 17, type: .envio,
            lineStatuses: Array(repeating: .esperandoPicking, count: 5)
        ))
        orders.append(makeOrder(hour: 17, type: .envio,
            lineStatuses: Array(repeating: .esperandoPicking, count: 17)
        ))
        orders.append(makeOrder(hour: 17, type: .envio,
            lineStatuses: Array(repeating: .esperandoPicking, count: 20)
        ))
        orders.append(makeOrder(hour: 17, type: .recogida,
            lineStatuses: Array(repeating: .esperandoPicking, count: 19)
        ))
        orders.append(makeOrder(hour: 17, type: .envio,
            lineStatuses: Array(repeating: .esperandoPicking, count: 13)
        ))
        orders.append(makeOrder(hour: 18, type: .envio,
            lineStatuses: Array(repeating: .esperandoPicking, count: 22)
        ))
        orders.append(makeOrder(hour: 18, type: .recogida,
            lineStatuses: Array(repeating: .esperandoPicking, count: 33)
        ))
        orders.append(makeOrder(hour: 18, type: .envio,
            lineStatuses: Array(repeating: .esperandoPicking, count: 11)
        ))
        orders.append(makeOrder(hour: 18, type: .envio,
            lineStatuses: Array(repeating: .esperandoPicking, count: 23)
        ))
        orders.append(makeOrder(hour: 18, type: .recogida,
            lineStatuses: Array(repeating: .esperandoPicking, count: 19)
        ))
        orders.append(makeOrder(hour: 18, type: .recogida,
            lineStatuses: Array(repeating: .esperandoPicking, count: 10)
        ))
        orders.append(makeOrder(hour: 19, type: .recogida,
            lineStatuses: Array(repeating: .esperandoPicking, count: 12)
        ))
        orders.append(makeOrder(hour: 19, type: .envio,
            lineStatuses: Array(repeating: .esperandoPicking, count: 32)
        ))
        orders.append(makeOrder(hour: 19, type: .recogida,
            lineStatuses: Array(repeating: .esperandoPicking, count: 41)
        ))
        orders.append(makeOrder(hour: 19, type: .recogida,
            lineStatuses: Array(repeating: .esperandoPicking, count: 12)
        ))
        orders.append(makeOrder(hour: 19, type: .recogida,
            lineStatuses: Array(repeating: .esperandoPicking, count: 12)
        ))
        orders.append(makeOrder(hour: 19, type: .envio,
            lineStatuses: Array(repeating: .esperandoPicking, count: 18)
        ))
        orders.append(makeOrder(hour: 19, type: .envio,
            lineStatuses: Array(repeating: .esperandoPicking, count: 15)
        ))
        orders.append(makeOrder(hour: 20, type: .recogida,
            lineStatuses: Array(repeating: .esperandoPicking, count: 19)
        ))
        orders.append(makeOrder(hour: 20, type: .recogida,
            lineStatuses: Array(repeating: .esperandoPicking, count: 3)
        ))

        return orders
    }
}
