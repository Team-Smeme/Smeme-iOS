//
//  ForeginDiaryResponse.swift
//  Smeme-iOS
//
//  Created by Joon Baek on 2023/01/11.
//

import Foundation

struct PostDiaryResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
}
