//
//  DashboardView.swift
//  OnlineStore.2.0
//
//  Created by Dario Marquez on 14/9/25.
//

import SwiftUI

struct DashboardView: View {
    @StateObject private var vm = DashboardViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    
                    // Cabecera
                    DashboardHeader(date: Date(), centerCode: vm.centerCode)
                    
                    // KPIs de pedidos en fila
                    HStack(spacing: 12) {
                        MetricCard(title: "Totales", value: "\(vm.totalOrders)")
                        MetricCard(title: "En curso", value: "\(vm.inProgressOrders)")
                        MetricCard(title: "Hechos", value: "\(vm.completedOrders)")
                    }
                    
                    // Gráfica de trabajo pendiente por hora
                    HourlyBarChartView(
                        data: vm.hourlyData,
                        maxValue: vm.hourlyData.map { $0.total }.max() ?? 0,
                        orders: vm.orders
                    )
                    
                    // 🔹 Quitada la card de Tiempo medio
                }
                .padding(.bottom)
            }
            .navigationBarHidden(true)
        }
    }
}
