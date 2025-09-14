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
    case esperandoReposicion = "Esp. Reposición"
    case esperandoCliente = "Esp. Cliente"
    case esperandoPacking = "Esp. Packing"
    case hecho = "Hechos"
}

struct Order: Identifiable {
    let id: String
    let status: OrderStatus
    let date: Date
    let lines: Int   // 🔹 número de artículos (líneas)
}
