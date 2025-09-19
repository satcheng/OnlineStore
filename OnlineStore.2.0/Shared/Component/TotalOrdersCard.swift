//
//  TotalOrdersCard.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 14/9/25.
//

import SwiftUI

struct TotalOrdersCard: View {
    let total: Int
    let completed: Int

    private var progress: Double {
        guard total > 0 else { return 0 }
        return Double(completed) / Double(total)
    }

    private var percentageText: String {
        guard total > 0 else { return "0%" }
        let percent = Int(progress * 100)
        return "\(percent)%"
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Total pedidos")
                .font(.headline)
                .foregroundColor(.primary)

            HStack {
                Text("\(completed)/\(total)")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.primary)

                Spacer()

                Text(percentageText)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.red.opacity(0.2))
                        .frame(height: 10)

                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.red)
                        .frame(width: geometry.size.width * progress,
                               height: 10)
                }
            }
            .frame(height: 10)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
    }
}
