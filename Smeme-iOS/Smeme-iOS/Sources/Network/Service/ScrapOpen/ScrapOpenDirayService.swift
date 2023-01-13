//
//  ScrapsOpenDirayService.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/12.
//

import Moya

enum ScrapOpenDirayService {
    case scraps(param: ScrapRequest)
}

extension ScrapOpenDirayService: BaseTargetType {
    var path: String {
        switch self {
        case .scraps:
            return URLConstant.scrapOpenDirayURL
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .scraps:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .scraps(let param):
            return .requestJSONEncodable(param)
        }
    }
    
    var headers: [String: String]? {
        return NetworkConstant.hasTokenHeader
    }
}
