//
//  OpenDiaryListService.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/11.
//

import Moya

enum OpenDiaryListService {
    case openDiaryTotalList
    case openDiarySelectList(param: Int)
}

extension OpenDiaryListService: BaseTargetType {
    var path: String {
        switch self {
        case .openDiaryTotalList, .openDiarySelectList:
            return URLConstant.openDiaryTotalListURL
        }
    }

    var method: Moya.Method {
        switch self {
        case .openDiaryTotalList, .openDiarySelectList:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case .openDiaryTotalList:
            return .requestPlain
        case .openDiarySelectList(let param):
            return .requestParameters(parameters: ["category": param], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        return NetworkConstant.hasTokenHeader
    }
}
