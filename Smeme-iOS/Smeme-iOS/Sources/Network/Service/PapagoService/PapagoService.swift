//
//  PapagoService.swift
//  PapagoPractice
//
//  Created by 황찬미 on 2022/12/09.
//

import Foundation
import Moya

enum PapagoService {
    case papago(param: String)
}

extension PapagoService: TargetType {
    var baseURL: URL {
        switch self {
        case .papago:
            return URL(string: "https://openapi.naver.com")!
        }
    }
    
    var path: String {
        switch self {
        case .papago:
            return URLConstant.papagoURL
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .papago:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .papago(let param):
            return .requestParameters(
                parameters: ["source": "ko",
                             "target": "en",
                             "text": param],
                encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return APIConstant.papagoNaverClientId
    }
}

