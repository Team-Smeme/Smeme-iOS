//
//  MyDiaryResponse.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/11.
//

import Foundation

struct MyDiaryListResponse: Codable {
    let diaryId: Int?
    let content, createdAt: String?
    let isPublic: Bool?
    let likeCnt: Int?
}
