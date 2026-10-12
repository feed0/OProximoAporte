//
//  TransactionModel+Mock.swift
//  OProximoAporteKit
//
//  Created by Felipe Campelo on 12/10/26.
//

import Foundation
@testable import OProximoAporteKit

extension TransactionModel {
    
    // MARK: - Buy / Sell
    
    static var buyMock: TransactionModel {
        TransactionModel(
            date: Date(timeIntervalSince1970: 1_700_000_000),
            kind: .buy,
            quantity: 100,
            unitPrice: Decimal(string: "35.5")!,
            fees: Decimal(string: "4.5")!,
        )
    }
    
    static var sellMock: TransactionModel {
        TransactionModel(
            date: Date(timeIntervalSince1970: 1_700_086_400),
            kind: .sell,
            quantity: 50,
            unitPrice: Decimal(string: "38")!,
            fees: Decimal(string: "4.5")!,
        )
    }
}
