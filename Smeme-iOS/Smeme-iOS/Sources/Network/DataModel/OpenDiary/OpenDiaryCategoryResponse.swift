//
//  OpenDiaryCategoryResponse.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/11.
//

import Foundation

struct OpenDiaryCategoryResponse: Codable {
    let categories: [Category]
}

struct Category: Codable {
    let id: Int
    let content: String
}
