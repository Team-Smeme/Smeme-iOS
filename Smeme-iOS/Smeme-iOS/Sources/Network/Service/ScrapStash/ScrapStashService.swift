//
//  ScrapStashService.swift
//  Smeme-iOS
//
//  Created by JH on 2023/01/12.
//

import Moya

enum ScrapStashService {
    case scrapStashList
}

extension ScrapStashService: BaseTargetType {
    var path: String {
        switch self {
        case .scrapStashList:
            return URLConstant.scrapStashListURL
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .scrapStashList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .scrapStashList:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return NetworkConstant.hasTokenHeader
    }
}
