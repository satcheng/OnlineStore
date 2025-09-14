//
//  OrderModels.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 14/9/25.
//

import Foundation

enum OrderStatus: String, CaseIterable {
    case pending
    case inProgress
    case completed
}

struct OrderLine: Identifiable {
    let id = UUID()
    let product: String
}

struct Order: Identifiable {
    let id: String
    let status: OrderStatus
    let lines: [OrderLine]
    let date: Date
}
