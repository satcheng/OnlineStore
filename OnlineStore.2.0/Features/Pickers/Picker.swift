//
//  Picker.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 20/9/25.
//


import Foundation

struct Picker: Identifiable {
    let id: String
    let initials: String
    let name: String
    var assignedOrders: [String]
}
