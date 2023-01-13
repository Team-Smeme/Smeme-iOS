//
//  ScrapStashService.swift
//  Smeme-iOS
//
//  Created by JH on 2023/01/12.
//

import Moya

enum MySmemeService {
    case userInfo
}

extension MySmemeService: BaseTargetType {
    var path: String {
        switch self {
        case .userInfo:
            return URLConstant.mySmemeURL
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .userInfo:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .userInfo:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return NetworkConstant.hasTokenHeader
    }
}
