//
//  AssetModel.swift
//  OProximoAporteKit
//
//  Created by feed0 on 13/07/26.
//

import Foundation
import SwiftData

@Model
public final class AssetModel {
    
    // MARK: - Properties
    
    public private(set) var id: UUID = UUID()
    
    var type = AssetTypeEnum.acao
    var name: String = ""
    
    /// Slug-style id, matches price-provider format
    var externalId: String? = nil
    
    // MARK: Ações & FIIs
    
    var ticker: String? = nil
    
    // MARK: Tesouro — identity is kind + maturity, not a ticker
    
    var tesouroKind: TesouroKindEnum? = nil
    var maturityDate: Date? = nil
    
    // MARK: Relationships
    
    @Relationship(
        deleteRule: .deny,
        inverse: \TransactionModel.asset
    )
    var transactions: [TransactionModel]? = []
    
    // MARK: - Init
    
    private init(
        type: AssetTypeEnum,
        name: String,
    ) {
        self.type = type
        self.name = name
    }
    
    // MARK: - Factory
    
    public static func acao(
        name: String,
        ticker: String,
        externalId: String? = nil,
    ) -> AssetModel {
        let asset = AssetModel(
            type: .acao,
            name: name
        )
        
        asset.ticker = ticker
        asset.externalId = externalId
        
        return asset
    }
    
    public static func fii(
        name: String,
        ticker: String,
        externalId: String? = nil,
    ) -> AssetModel {
        let asset = AssetModel(
            type: .fii,
            name: name
        )
        
        asset.ticker = ticker
        asset.externalId = externalId
        
        return asset
    }
    
    public static func tesouro(
        name: String,
        kind: TesouroKindEnum,
        maturityDate: Date,
        externalId: String,
    ) -> AssetModel {
        let asset = AssetModel(
            type: .tesouro,
            name: name
        )
        
        asset.tesouroKind = kind
        asset.maturityDate = maturityDate
        asset.externalId = externalId
        
        return asset
    }
    
}
