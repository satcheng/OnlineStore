//
//  PickerService.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 20/9/25.
//

import Foundation

struct PickerService {
    static func samplePickers() -> [Picker] {
        return [
            Picker(
                id: UUID().uuidString,
                initials: "JD",
                name: "Juan Díaz",
                assignedOrders: ["000000000019"]
            ),
            Picker(
                id: UUID().uuidString,
                initials: "LM",
                name: "Laura Martín",
                assignedOrders: ["000000000022"]
            ),
            Picker(
                id: UUID().uuidString,
                initials: "JF",
                name: "Julia Fernández",
                assignedOrders: ["000000000023"]
            ),
            Picker(
                id: UUID().uuidString,
                initials: "ML",
                name: "María López",
                assignedOrders: ["000000000024"]
            ),
            Picker(
                id: UUID().uuidString,
                initials: "AC",
                name: "Ana Cruz",
                assignedOrders: ["000000000020"]
            )
        ]
    }
}
