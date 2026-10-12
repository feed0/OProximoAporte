//
//  SwiftDataAssetRepository.swift
//  OProximoAporteKit
//
//  Created by feed0 on 8/28/26.
//

import Foundation
import SwiftData

public final class AssetRepository: AssetRepositoryProtocol {
    
    // MARK: - Properties
    
    private let modelContext: ModelContext
    
    // MARK: - Init
    
    public init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    // MARK: - Public methods
    
    // MARK: Create
    
    public func create(_ asset: AssetModel) throws {
        modelContext.insert(asset)
        try modelContext.save()
    }
    
    // MARK: Read
    
    public func fetchAll() throws -> [AssetModel] {
        let descriptor = FetchDescriptor<AssetModel>()
        return try modelContext.fetch(descriptor)
    }
    
    public func fetch(id: UUID) throws -> AssetModel? {
        let descriptor = FetchDescriptor<AssetModel>(
            predicate: #Predicate { $0.id == id }
        )
        return try modelContext.fetch(descriptor).first
    }
    
    // MARK: Update
    
    // MARK: Delete
    
    /// Deletes an Asset
    /// Only if it has no transactions
    public func delete(_ asset: AssetModel) throws {
        guard (asset.transactions ?? []).isEmpty else {
            throw AssetRepositoryError.cannotDeleteAssetWithTransactions
        }
        modelContext.delete(asset)
        try modelContext.save()
    }
}
