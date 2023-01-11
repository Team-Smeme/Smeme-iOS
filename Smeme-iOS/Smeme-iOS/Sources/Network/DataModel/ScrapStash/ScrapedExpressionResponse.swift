//
//  ScrapedExpressionModel.swift
//  Smeme-iOS
//
//  Created by JH on 2023/01/05.
//

import Foundation
//
//struct ScrapedExpressionModel {
//    let scrapedExpression: String
//}

// MARK: - DataClass

struct ScrapedExpressionResponse: Codable {
    let scraps: [Scrap]
}

// MARK: - Scrap

struct Scrap: Codable {
    let id: Int
    let paragraph, createdAt: String
}
