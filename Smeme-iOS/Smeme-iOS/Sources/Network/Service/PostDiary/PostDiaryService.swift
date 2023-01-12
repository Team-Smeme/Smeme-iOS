//
//  PostDiaryService.swift
//  Smeme-iOS
//
//  Created by Joon Baek on 2023/01/11.
//

import Moya

enum PostDiaryService {
    case postDiary(param: PostDiaryRequest)
}

extension PostDiaryService: BaseTargetType {
    var path: String {
        switch self {
        case .postDiary:
            return URLConstant.postDiaryURL
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postDiary:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .postDiary(let param):
            return .requestJSONEncodable(param)
        }
    }
    
    var headers: [String: String]? {
        return NetworkConstant.hasTokenHeader
    }
}
