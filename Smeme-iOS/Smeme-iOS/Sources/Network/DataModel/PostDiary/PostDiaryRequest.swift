//
//  PostDiaryRequest.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/13.
//

import Foundation

struct PostDiaryRequest: Codable {
    let content: String
    let targetLang: String
    let topicID: Int
    let isPublic: Bool

    enum CodingKeys: String, CodingKey {
        case content, targetLang
        case topicID = "topicId"
        case isPublic
    }
}
