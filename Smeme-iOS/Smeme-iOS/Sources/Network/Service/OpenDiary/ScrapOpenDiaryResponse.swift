//
//  ScrapOpenDiaryResponse.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/12.
//

import Foundation

struct ScrapOpenDiaryReponse: Codable {
    let scrapID: Int

    enum CodingKeys: String, CodingKey {
        case scrapID = "scrapId"
    }
}
