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

                    // Cabecera con fecha y centro
                    DashboardHeader(
                        date: Date(),
                        centerCode: "023"
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
                        ForEach([OrderStatus.esperandoCliente, .esperandoPacking, .hecho], id: \.self) { status in
                            NavigationLink {
                                OrdersListView(viewModel: viewModel, filterStatus: status)
                            } label: {
                                MetricCard(title: status.rawValue,
                                           value: viewModel.count(for: status))
                            }
                        }
                    }

                    // Gráfica horaria con callback
                    HourlyBarChartView(
                        data: viewModel.hourlyData,
                        onHourTap: { hour in
                            selectedHour = hour
                        }
                    )

                    // NavigationLink oculto para navegar desde la gráfica
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
