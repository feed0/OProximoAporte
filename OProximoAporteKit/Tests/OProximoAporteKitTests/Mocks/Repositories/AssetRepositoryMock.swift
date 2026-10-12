//
//  AssetRepositoryMock.swift
//  OProximoAporteKit
//
//  Created by Felipe Campelo on 12/10/26.
//

import Foundation
@testable import OProximoAporteKit

final class AssetRepositoryMock: AssetRepositoryProtocol {
    
    // MARK: - Properties
    
    var assets: [AssetModel] = []
    var errorToThrow: Error?
    
    // MARK: Spies
    
    private(set) var deletedAssets: [AssetModel] = []
    
    // MARK: - Public methods
    
    func create(_ asset: AssetModel) throws {
        if let errorToThrow { throw errorToThrow }
        guard !assets.contains(where: { $0.id == asset.id }) else { return }
        assets.append(asset)
    }
    
    func fetchAll() throws -> [AssetModel] {
        if let errorToThrow { throw errorToThrow }
        return assets
    }
    
    func fetch(id: UUID) throws -> AssetModel? {
        if let errorToThrow { throw errorToThrow }
        return assets.first { $0.id == id }
    }
    
    func delete(_ asset: AssetModel) throws {
        if let errorToThrow { throw errorToThrow }
        deletedAssets.append(asset)
        assets.removeAll { $0.id == asset.id }
    }
}
