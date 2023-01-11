//
//  RandomSubjectService.swift
//  Smeme-iOS
//
//  Created by Joon Baek on 2023/01/11.
//

import Moya

enum RandomSubjectService {
    case randomSubject
}

extension RandomSubjectService: BaseTargetType {
    var path: String {
        switch self {
        case .randomSubject:
            return URLConstant.randomSubjectURL
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .randomSubject:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .randomSubject:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return NetworkConstant.hasTokenHeader
    }
}
