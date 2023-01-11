//
//  OpenDiaryCategoryService.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/11.
//

import Moya

enum OpenDiaryCategoryService {
    case openDiaryCategory
}

extension OpenDiaryCategoryService: BaseTargetType {
    var path: String {
        switch self {
        case .openDiaryCategory:
            return URLConstant.openDiaryCategoryURL
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .openDiaryCategory:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .openDiaryCategory:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return NetworkConstant.hasTokenHeader
    }
}
