//
//  MyDiaryService.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/11.
//

import Moya

enum MyDiaryService {
    case totalMyDiary
}

extension MyDiaryService: BaseTargetType {
    var path: String {
        switch self {
        case .totalMyDiary:
            return URLConstant.totalMyDiaryListURL
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .totalMyDiary:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .totalMyDiary:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .totalMyDiary:
            return NetworkConstant.hasTokenHeader
        }
    }
}
