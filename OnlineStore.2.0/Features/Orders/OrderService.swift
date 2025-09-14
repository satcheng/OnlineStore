//
//  OrderService.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 14/9/25.
//

import Foundation

struct OrderService {
    static func sampleOrders() -> [Order] {
        return [
            Order(id: "000000000001", status: .esperandoPicking, date: Date(), lines: 3),
            Order(id: "000000000002", status: .enPicking, date: Date(), lines: 5),
            Order(id: "000000000003", status: .esperandoReposicion, date: Date(), lines: 2),
            Order(id: "000000000004", status: .esperandoCliente, date: Date(), lines: 1),
            Order(id: "000000000005", status: .esperandoPacking, date: Date(), lines: 4),
            Order(id: "000000000006", status: .hecho, date: Date(), lines: 6),
            Order(id: "000000000007", status: .hecho, date: Date(), lines: 3)
        ]
    }
}
