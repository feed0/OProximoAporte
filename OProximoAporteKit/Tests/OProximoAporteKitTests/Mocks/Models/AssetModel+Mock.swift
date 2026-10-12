//
//  AssetModel+Mock.swift
//  OProximoAporteKit
//
//  Created by Felipe Campelo on 11/10/26.
//

import Foundation
@testable import OProximoAporteKit

extension AssetModel {
    
    // MARK: - Acao
    
    static var petrobrasMock: AssetModel {
        .acao(
            name: "Petrobras",
            ticker: "PETR4",
        )
    }
    
    static var valeMock: AssetModel {
        .acao(
            name: "Vale",
            ticker: "VALE3",
        )
    }
}
