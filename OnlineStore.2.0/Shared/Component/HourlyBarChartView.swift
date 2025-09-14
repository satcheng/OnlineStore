//
//  HourlyBarChartView.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 14/9/25.
//

import SwiftUI

struct HourlyBarChartView: View {
    let data: [HourlyData]
    var onHourTap: ((Int) -> Void)? = nil

    var body: some View {
        VStack(alignment: .leading) {
            Text("Trabajo pendiente por hora")
                .font(.headline)
                .padding(.bottom, 4)

            HStack(alignment: .bottom, spacing: 8) {
                ForEach(data) { entry in
                    VStack {
                        ZStack(alignment: .bottom) {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.red.opacity(0.3))
                                .frame(height: CGFloat(entry.total) * 10)

                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.red)
                                .frame(height: CGFloat(entry.completed) * 10)
                        }
                        .onTapGesture {
                            onHourTap?(entry.hour)
                        }

                        Text("\(entry.hour)")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
            }
            .frame(maxHeight: 200)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
    }
}
