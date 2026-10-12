import Foundation
import SwiftData
import Testing
@testable import OProximoAporteKit

@Suite("AssetRepository")
struct AssetRepositoryTests {
    
    // MARK: - Properties
    
    let sut: AssetRepository
    
    // MARK: - Init
    
    init() throws {
        let schema = Schema([
            AssetModel.self,
            TransactionModel.self,
        ])
        let config = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: true,
        )
        let container = try ModelContainer(
            for: schema,
            configurations: [config],
        )
        
        sut = AssetRepository(modelContext: ModelContext(container))
    }
    
    // MARK: - Create
    
    // MARK: create(_ asset:)
    
    @Test("create(_:) persists the asset")
    func create_WhenAssetIsValid() throws {
        // Arrange
        let asset = AssetModel.petrobrasMock
        
        // Act
        try sut.create(asset)
        
        // Assert
        let result = try sut.fetchAll()
        #expect(result.count == 1)
        #expect(result.first?.id == asset.id)
    }
    
    @Test("create(_:) keeps the asset's data")
    func create_PreservesAssetData() throws {
        // Arrange
        let asset = AssetModel.valeMock
        
        // Act
        try sut.create(asset)
        
        // Assert
        let result = try sut.fetch(id: asset.id)
        #expect(result?.name == asset.name)
        #expect(result?.ticker == asset.ticker)
    }
    
    // MARK: - Read
    
    // MARK: fetchAll()
    
    @Test("fetchAll() returns an empty array when nothing is persisted")
    func fetchAll_WhenNothingIsPersisting() throws {
        // Act
        let result = try sut.fetchAll()
        
        // Assert
        #expect(result.isEmpty)
    }
    
    @Test("fetchAll() returns every persisted asset")
    func fetchAll_WhenMultipleAssetsArePersisting() throws {
        // Arrange
        let petrobras = AssetModel.petrobrasMock
        let vale = AssetModel.valeMock
        let assets = [
            petrobras,
            vale,
        ]
        for asset in assets {
            try sut.create(asset)
        }
        
        // Act
        let result = try sut.fetchAll()
        
        // Assert
        #expect(result.count == 2)
        #expect(Set(result.map(\.id)) == Set(assets.map(\.id)))
    }
    
    // MARK: fetch(id:)
    
    @Test("fetch(id:) returns the asset when it exists")
    func fetch_WhenAssetIsPersisting() throws {
        // Arrange
        let asset = AssetModel.petrobrasMock
        try sut.create(asset)
        
        // Act
        let result = try sut.fetch(id: asset.id)
        
        // Assert
        #expect(result?.id == asset.id)
        #expect(result?.name == asset.name)
    }
    
    @Test("fetch(id:) returns nil when the id doesn't exist")
    func fetch_WhenIdIsntPersisting() throws {
        // Act
        let result = try sut.fetch(id: UUID())
        
        // Assert
        #expect(result == nil)
    }
    
    // MARK: - Update
    
    // MARK: - Delete
    
    // MARK: delete(_ asset:)
    
    @Test("delete(_:) removes an asset that has no transactions")
    func delete_WhenAssetHasNoTransactions() throws {
        // Arrange
        let asset = AssetModel.petrobrasMock
        try sut.create(asset)
        
        // Act
        try sut.delete(asset)
        
        // Assert
        #expect(try sut.fetch(id: asset.id) == nil)
    }
    
    @Test("delete(_:) throws when the asset has transactions")
    func delete_WhenAssetHasTransactions() throws {
        // Arrange
        let asset = AssetModel.petrobrasMock
        asset.transactions?.append(.buyMock)
        try sut.create(asset)
        
        // Act & Assert
        #expect(throws: AssetRepositoryError.cannotDeleteAssetWithTransactions) {
            try sut.delete(asset)
        }
    }
    
    @Test("delete(_:) keeps the asset persisted when it has transactions")
    func delete_WhenAssetHasTransactions_KeepsAsset() throws {
        // Arrange
        let asset = AssetModel.petrobrasMock
        asset.transactions?.append(.buyMock)
        try sut.create(asset)
        
        // Act
        try? sut.delete(asset)
        
        // Assert
        #expect(try sut.fetch(id: asset.id) != nil)
    }
    
    @Test("delete(_:) on a never-persisted asset persists nothing")
    func delete_WhenAssetWasNeverPersisted() throws {
        // Arrange
        let asset = AssetModel.petrobrasMock
        
        // Act
        try sut.delete(asset)
        
        // Assert
        #expect(try sut.fetchAll().isEmpty)
    }
}
