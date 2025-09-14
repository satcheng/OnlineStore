//
//  HourlyData.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 14/9/25.
//

import Foundation

struct HourlyData: Identifiable {
    let id = UUID()
    let hour: Int
    let total: Int
    let completed: Int
}
