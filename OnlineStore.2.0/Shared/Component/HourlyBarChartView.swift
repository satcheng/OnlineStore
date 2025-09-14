//
//  HourlyBarChartView.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 14/9/25.
//

import SwiftUI

struct HourlyBarChartView: View {
    let data: [HourlyData]
    let maxValue: Int
    let orders: [Order]

    private let chartHeight: CGFloat = 120

    var body: some View {
        let chartMax = max(1, maxValue)
        let step = max(1, chartMax / 5)
        let topTick = ((chartMax + step - 1) / step) * step
        let ticks: [Int] = Array(stride(from: topTick, through: 0, by: -step))

        VStack(spacing: 0) {
            Text("Trabajo pendiente por hora")
                .font(.title2.weight(.semibold))
                .foregroundColor(Theme.Colors.primaryText)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.top, .horizontal], 16)

            Divider()
                .background(Theme.Colors.secondaryText.opacity(0.3))
                .padding(.horizontal, 16)
                .padding(.bottom, 12)

            HStack(alignment: .bottom, spacing: 8) {
                // Eje Y
                VStack(spacing: 0) {
                    ForEach(ticks, id: \.self) { tick in
                        HStack {
                            Spacer()
                            Text("\(tick)")
                                .font(.caption2)
                                .foregroundColor(Theme.Colors.secondaryText)
                        }
                        .frame(height: chartHeight / CGFloat(max(1, ticks.count - 1)))
                    }
                }
                .frame(width: 26)

                // Barras
                HStack(alignment: .bottom, spacing: 6) {
                    ForEach(data) { entry in
                        NavigationLink(
                            destination: OrdersListView(
                                orders: orders,
                                hourFilter: entry.hour
                            )
                        ) {
                            VStack {
                                ZStack(alignment: .bottom) {
                                    Rectangle()
                                        .fill(Theme.Colors.pedidoRed.opacity(0.3))
                                        .frame(height: CGFloat(entry.total) / CGFloat(topTick) * chartHeight)

                                    Rectangle()
                                        .fill(Theme.Colors.pedidoRed)
                                        .frame(height: CGFloat(entry.completed) / CGFloat(topTick) * chartHeight)
                                }

                                Text("\(entry.hour)")
                                    .font(.caption2)
                                    .foregroundColor(Theme.Colors.secondaryText)
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .frame(height: chartHeight + 24)
            .padding()
        }
        .background(
            Theme.Colors.cardBackground,
            in: RoundedRectangle(cornerRadius: Theme.Layout.cornerRadius)
        )
    }
}
