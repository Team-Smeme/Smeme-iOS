//
//  ScrapStashService.swift
//  Smeme-iOS
//
//  Created by JH on 2023/01/12.
//

import Moya

enum ScrapStashService {
    case scrapStashList
    case deleteScrap
}

extension ScrapStashService: BaseTargetType {
    var path: String {
        switch self {
        case .scrapStashList:
            return URLConstant.scrapStashListURL
        case .deleteScrap:
            return URLConstant.scrapDeleteURL
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .scrapStashList:
            return .get
        case .deleteScrap:
            return.delete
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .scrapStashList:
            return .requestPlain
        case .deleteScrap:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return NetworkConstant.hasTokenHeader
    }
}
