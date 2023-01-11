//
//  MySmemeResponse.swift
//  Smeme-iOS
//
//  Created by JH on 2023/01/12.
//

import Foundation

struct MySmemeResponse: Codable {
    let userInfo: [UserInfo]
}

struct UserInfo: Codable {
    let username: String
    let targetLang: String
    let bio: String
}
