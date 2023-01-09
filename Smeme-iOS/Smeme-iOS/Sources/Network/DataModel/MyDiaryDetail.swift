//
//  MyDiaryDetail.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/08.
//

import Foundation

struct MyDiaryDetailResponse {
    let content: String
    let category: String
    let topic: String
    let isPublic: Bool
    let createdAt: String // yyyy-MM-DD HH:mm
    let likeCnt: Int
    
    enum CodingKeys: String, CodingKey {
        case topicName = "category"
        case topicContent = "topic"
    }
}
