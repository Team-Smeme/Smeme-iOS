//
//  OpenDiaryListService.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/11.
//

import Moya

enum OpenDiaryListService {
    case openDiaryTotalList
    case openDiaryDailyList
    case openDiarySelectList(param: Int)
}

extension OpenDiaryListService: BaseTargetType {
    var path: String {
        switch self {
        case .openDiaryTotalList:
            return URLConstant.openDiaryTotalListURL
        case .openDiaryDailyList:
            return URLConstant.openDiarySelectListURL + "0"
        case .openDiarySelectList(let param):
            return URLConstant.openDiarySelectListURL + "\(param)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .openDiaryTotalList, .openDiaryDailyList, .openDiarySelectList:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case .openDiaryTotalList, .openDiaryDailyList, .openDiarySelectList:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return NetworkConstant.hasTokenHeader
    }
}
