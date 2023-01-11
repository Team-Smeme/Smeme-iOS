//
//  OpenDiaryListResponse.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/11.
//

import Foundation

// MARK: - OpenDiaryListResponse

struct OpenDiaryListResponse: Codable {
    let diaries: [DiaryList]
}

// MARK: - DiaryList

struct DiaryList: Codable {
    let diaryID: Int
    let content: String
    let likeCnt: Int
    let userID: Int
    let username: String
    let isSeen: Bool
    let hasLike: Bool
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case diaryID = "diaryId"
        case content, likeCnt
        case userID = "userId"
        case username, isSeen, hasLike, createdAt
    }
}
