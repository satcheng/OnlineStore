//
//  MetricCard.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 14/9/25.
//

import SwiftUI

struct MetricCard: View {
    let title: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline.weight(.medium))
                .foregroundColor(Theme.Colors.secondaryText)

            Text(value)
                .font(.title3.weight(.semibold))
                .foregroundColor(Theme.Colors.primaryText)
        }
        .padding()
        .frame(maxWidth: .infinity) // 🔹 se expanden de forma igualitaria en HStack
        .background(
            Theme.Colors.cardBackground,
            in: RoundedRectangle(cornerRadius: 16)
        )
    }
}
