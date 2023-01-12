//
//  ScrapRequest.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/12.
//

import Foundation

struct ScrapRequest: Codable {
    let diaryID: Int
    let paragraph: String

    enum CodingKeys: String, CodingKey {
        case diaryID = "diaryId"
        case paragraph
    }
}
