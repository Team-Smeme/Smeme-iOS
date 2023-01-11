//
//  MySmemeResponse.swift
//  Smeme-iOS
//
//  Created by JH on 2023/01/12.
//

import Foundation

// MARK: - DataClass

struct userInfoResponse: Codable {
    let username: String
    let targetLang: String
    let bio: String
}
