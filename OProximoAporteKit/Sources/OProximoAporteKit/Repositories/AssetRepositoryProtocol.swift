//
//  AssetRepositoryProtocol.swift
//  OProximoAporteKit
//
//  Created by feed0 on 8/28/26.
//

import Foundation

public protocol AssetRepositoryProtocol {
    func create(_ asset: AssetModel) throws
    func fetchAll() throws -> [AssetModel]
    func fetch(id: UUID) throws -> AssetModel?
    func delete(_ asset: AssetModel) throws
}
