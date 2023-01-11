//
//  DetailOpenDiaryResponse.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/11.
//

import Foundation

struct DetailOpenDiaryResponse: Codable {
    let diaryID: Int
    let content: String
    let category: String
    let topic: String
    let likeCnt: Int
    let createdAt: String
    let userID: Int
    let username: String
    let bio: String
    let hasLike: Bool

    enum CodingKeys: String, CodingKey {
        case diaryID = "diaryId"
        case content, category, topic, likeCnt, createdAt
        case userID = "userId"
        case username, bio, hasLike
    }
}
