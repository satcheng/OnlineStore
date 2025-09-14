//
//  OrderService.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 14/9/25.
//

import Foundation

struct OrderService {
    static let sample: [Order] = {
        var orders: [Order] = []
        let calendar = Calendar.current

        // 50 pedidos distribuidos entre las 10h y las 20h
        for i in 1...50 {
            let randomHour = Int.random(in: 10...20)
            let date = calendar.date(
                bySettingHour: randomHour,
                minute: Int.random(in: 0..<60),
                second: 0,
                of: Date()
            )!

            let status: OrderStatus = {
                let r = Int.random(in: 0...2)
                return r == 0 ? .pending : (r == 1 ? .inProgress : .completed)
            }()

            let lines = (1...Int.random(in: 1...5)).map { _ in
                OrderLine(product: "Producto \((1...100).randomElement()!)")
            }

            let order = Order(
                id: String(format: "%012d", i),
                status: status,
                lines: lines,
                date: date
            )

            orders.append(order)
        }
        return orders
    }()
}
