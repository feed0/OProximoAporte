//
//  TransactionModel.swift
//  OProximoAporteKit
//
//  Created by feed0 on 13/07/26.
//

import Foundation
import SwiftData

@Model
public final class TransactionModel {
    
    // MARK: - Properties
    
    public private(set) var id: UUID = UUID()
    
    var date: Date = Date()
    var kind = TransactionKindEnum.buy
    var quantity: Decimal = 0
    var unitPrice: Decimal  = 0
    var fees: Decimal  = 0
    var notes: String? = nil
    
    // MARK: Relationships
    
    internal var asset: AssetModel? = nil
    
    // MARK: - Init
    
    public init(
        date: Date,
        kind: TransactionKindEnum,
        quantity: Decimal,
        unitPrice: Decimal,
        fees: Decimal,
    ) {
        self.date = date
        self.kind = kind
        self.quantity = quantity
        self.unitPrice = unitPrice
        self.fees = fees
    }
}
