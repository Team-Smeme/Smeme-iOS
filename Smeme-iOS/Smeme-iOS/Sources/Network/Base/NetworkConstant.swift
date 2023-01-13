//
//  NetworkConstant.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2022/12/29.
//

import Foundation

enum NetworkConstant {
    static let noTokenHeader = ["Content-Type": "application/json"]
    static let hasTokenHeader = ["Content-Type": "application/json",
                                 "Authorization": APIConstant.bearerToken]
}
