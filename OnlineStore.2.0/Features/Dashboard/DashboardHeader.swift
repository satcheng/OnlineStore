//
//  DashboardHeader.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 14/9/25.
//

import SwiftUI

struct DashboardHeader: View {
    let date: Date
    let centerCode: String

    var body: some View {
        VStack(spacing: 8) {
            // Fecha
            Text(dateFormatted)
                .font(.subheadline.weight(.medium))
                .foregroundColor(Theme.Colors.secondaryText)
                .frame(maxWidth: .infinity, alignment: .leading)

            // Centro
            Text("CENTRO \(centerCode)")
                .font(.title3.weight(.semibold))
                .foregroundColor(Theme.Colors.primaryText)
                .frame(maxWidth: .infinity, alignment: .leading)

            // Título PEDIDOS
            Text("Pedidos")
                .font(.largeTitle.weight(.bold))
                .foregroundColor(Theme.Colors.primaryText)
                .frame(maxWidth: .infinity, alignment: .leading)

            Divider()
                .background(Theme.Colors.secondaryText.opacity(0.3))
        }
        .padding(.horizontal)
        .padding(.top, 12)
    }

    private var dateFormatted: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "es_ES")
        formatter.dateFormat = "EEEE, d MMM"
        return formatter.string(from: date).uppercased()
    }
}
