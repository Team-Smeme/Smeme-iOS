//
//  PostDiaryResponse.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/13.
//

import Foundation

struct PostDiaryResponse: Codable {
    let diaryID: Int

    enum CodingKeys: String, CodingKey {
        case diaryID = "diaryId"
    }
}
