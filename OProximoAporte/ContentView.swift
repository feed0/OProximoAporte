//
//  ContentView.swift
//  OProximoAporte
//
//  Created by Felipe Campelo on 06/07/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            ContentUnavailableView(
                "Nenhum ativo ainda",
                systemImage: "chart.line.uptrend.xyaxis",
                description: Text("Adicione seu primeiro ativo para começar a acompanhar seu portfólio.")
            )
            .navigationTitle("OProximoAporte")
        } detail: {
            Text("Selecione um ativo")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ContentView()
}
