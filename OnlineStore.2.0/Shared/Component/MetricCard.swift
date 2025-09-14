//
//  MetricCard.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 14/9/25.
//

import SwiftUI

struct MetricCard: View {
    let title: String
    let value: Int   // 👈 ahora es Int, no String

    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)

            Text("\(value)")   // 👈 lo convertimos a String aquí
                .font(.title)
                .bold()
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity, minHeight: 80)
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
    }
}

#Preview {
    HStack(spacing: 12) {
        MetricCard(title: "Esp. Picking", value: 5)
        MetricCard(title: "En Picking", value: 3)
        MetricCard(title: "Hechos", value: 12)
    }
    .padding()
}
