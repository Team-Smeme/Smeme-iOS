//
//  OpenDiaryListService.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/11.
//

import Moya

enum OpenDiaryListService {
    case openDiaryTotalList
}

extension OpenDiaryListService: BaseTargetType {
    var path: String {
        switch self {
        case .openDiaryTotalList:
            return URLConstant.openDiaryToTalListURL
        }
    }

    var method: Moya.Method {
        switch self {
        case .openDiaryTotalList:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case .openDiaryTotalList:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        return NetworkConstant.hasTokenHeader
    }
}

