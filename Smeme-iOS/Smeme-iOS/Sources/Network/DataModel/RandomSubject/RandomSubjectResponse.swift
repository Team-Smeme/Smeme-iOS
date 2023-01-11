//
//  RandomSubjectResponse.swift
//  Smeme-iOS
//
//  Created by Joon Baek on 2023/01/11.
//

import Foundation

struct RandomSubject: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: DataClass
}

struct DataClass: Codable {
    let id: Int
    let content: String
}
