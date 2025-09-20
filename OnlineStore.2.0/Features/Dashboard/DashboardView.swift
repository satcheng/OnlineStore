//
//  DashboardView.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 14/9/25.
//

import SwiftUI

struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel()
    @State private var selectedHour: Int? = nil

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {

                    // Cabecera
                    DashboardHeader(
                        date: Date(),
                        centerCode: "023"
                    )

                    // 👉 KPI de total pedidos con barra horizontal
                    TotalOrdersCard(
                        totalOrders: viewModel.total,
                        completedOrders: viewModel.count(for: .hecho),
                        totalLines: viewModel.totalLines,
                        completedLines: viewModel.completedLines
                    )


                    // KPIs (fila 1)
                    HStack(spacing: 12) {
                        ForEach([OrderStatus.esperandoPicking, .enPicking, .esperandoReposicion], id: \.self) { status in
                            NavigationLink {
                                OrdersListView(viewModel: viewModel, filterStatus: status)
                            } label: {
                                MetricCard(title: status.rawValue,
                                           value: viewModel.count(for: status))
                            }
                        }
                    }

                    // KPIs (fila 2)
                    HStack(spacing: 12) {
                        ForEach([OrderStatus.esperandoCliente, .esperandoPacking, .enPacking], id: \.self) { status in
                            NavigationLink {
                                OrdersListView(viewModel: viewModel, filterStatus: status)
                            } label: {
                                MetricCard(title: status.rawValue,
                                           value: viewModel.count(for: status))
                            }
                        }
                    }

                    // Gráfica horaria
                    HourlyBarChartView(
                        data: viewModel.hourlyData,
                        onHourTap: { hour in
                            selectedHour = hour
                        }
                    )

                    // NavigationLink oculto para navegar desde gráfica
                    NavigationLink(
                        destination: Group {
                            if let hour = selectedHour {
                                OrdersListView(viewModel: viewModel, filterHour: hour)
                            } else {
                                EmptyView()
                            }
                        },
                        isActive: Binding(
                            get: { selectedHour != nil },
                            set: { if !$0 { selectedHour = nil } }
                        )
                    ) {
                        EmptyView()
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
            }
            .navigationBarHidden(true)
        }
    }
}
