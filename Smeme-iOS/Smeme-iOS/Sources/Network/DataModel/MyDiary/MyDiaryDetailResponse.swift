//
//  MyDiaryDetail.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/08.
//

import Foundation

struct MyDiaryDetailResponse: Codable {
    let content: String
    let topicID: Int
    let topic, category: String
    let isPublic: Bool
    let createdAt: String
    let likeCnt: Int
    
    enum CodingKeys: String, CodingKey {
        case content
        case topicID = "topicId"
        case topic, category, isPublic, createdAt, likeCnt
    }
}
