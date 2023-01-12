//
//  DetailOpenDiaryService.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/13.
//

import Moya

enum DetailOpenDiaryService {
    case detailOpenDiary(param: Int)
}

extension DetailOpenDiaryService: BaseTargetType {
    var path: String {
        switch self {
        case .detailOpenDiary(let param):
            return URLConstant.openDiaryTotalListURL + "\(param)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case.detailOpenDiary:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case.detailOpenDiary:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return NetworkConstant.hasTokenHeader
    }
}
