//
//  MyDiaryService.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/11.
//

import Moya

enum MyDiaryService {
    case totalMyDiary
    case detailMyDiary(diaryId: Int)
    case deleteDiary(diaryId: Int)
}

extension MyDiaryService: BaseTargetType {
    var path: String {
        switch self {
        case .totalMyDiary:
            return URLConstant.totalMyDiaryListURL
        case .detailMyDiary(let diaryId), .deleteDiary(let diaryId):
            return URLConstant.detailMyDiaryListURL + "\(diaryId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .totalMyDiary:
            return .get
        case .detailMyDiary:
            return .get
        case .deleteDiary:
            return .delete
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .totalMyDiary:
            return .requestPlain
        case .detailMyDiary:
            return .requestPlain
        case .deleteDiary:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return NetworkConstant.hasTokenHeader
    }
}
