//
//  OrderModels.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 14/9/25.
//

import Foundation

enum OrderStatus: String, CaseIterable {
    case esperandoPicking = "Esp. Picking"
    case enPicking = "En Picking"
    case endedPicking = "Picking Finalizado"
    case esperandoReposicion = "Reposición"
    case esperandoCliente = "Esp. Cliente"
    case esperandoPacking = "Esp. Packing"
    case enPacking = "En Packing"
    case hecho = "Hechos"
}

struct OrderLine: Identifiable {
    let id = UUID()
    var status: OrderStatus
}

struct Order: Identifiable {
    let id: String       // 🔹 número de pedido en formato 12 dígitos
    let date: Date
    var lines: [OrderLine]

    /// Estado del pedido = el estado más bajo de sus líneas
    var status: OrderStatus {
        lines.map { $0.status }.min { lhs, rhs in
            OrderStatus.allCases.firstIndex(of: lhs)! < OrderStatus.allCases.firstIndex(of: rhs)!
        } ?? .esperandoPicking
    }
}
