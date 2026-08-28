//
//  OProximoAporteApp.swift
//  OProximoAporte
//
//  Created by Felipe Campelo on 06/07/26.
//

import SwiftUI
import SwiftData
import OProximoAporteKit

@main
struct OProximoAporteApp: App {
    
    // MARK: - Properties
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            AssetModel.self,
            TransactionModel.self,
        ])
        
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false,
        )

        do {
            return try ModelContainer(
                for: schema,
                configurations: [modelConfiguration],
            )
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    // MARK: - Body
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
