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
    @State private var showMenu = false

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    // Fecha
                    Text(dateFormatted)
                        .font(.subheadline.weight(.medium))
                        .foregroundColor(Theme.Colors.secondaryText)

                    // Centro
                    Text("CENTRO \(centerCode)")
                        .font(.title3.weight(.semibold))
                        .foregroundColor(Theme.Colors.primaryText)
                }

                Spacer()

                // 🔹 Botón de menú hamburguesa
                Menu {
                    Button("Configuración", action: {})
                    Button("Cerrar sesión", action: {})
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.title2)
                        .foregroundColor(Theme.Colors.primaryText)
                        .padding(.trailing, 8)
                }
            }

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
