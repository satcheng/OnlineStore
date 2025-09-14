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
                    
                    // Cabecera de Pedidos
                    DashboardHeader(date: Date(), centerCode: vm.centerCode)
                    
                    // Card de pedidos
                    PedidoRingCard(
                        completed: vm.completedOrders,
                        total: vm.totalOrders
                    )
                    
                    // Gráfica de trabajo pendiente por hora
                    HourlyBarChartView(
                        data: vm.hourlyData,
                        maxValue: vm.hourlyData.map { $0.total }.max() ?? 0,
                        orders: vm.orders
                    )
                    
                    // Métricas
                    HStack(spacing: 16) {
                        MetricCard(title: "Pendientes", value: "\(vm.pendingOrders)")
                        MetricCard(title: "En curso", value: "\(vm.inProgressOrders)")
                    }
                    
                    HStack(spacing: 16) {
                        MetricCard(title: "Completados", value: "\(vm.completedOrders)")
                        MetricCard(title: "Tiempo medio", value: "\(vm.avgTime)m\nOBJ: 12m")
                    }
                }
                .padding(.bottom)
            }
            .navigationBarHidden(true)
        }
    }
}
