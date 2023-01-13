//
//  SignUpService.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/12.
//

import Moya

enum SignUpService {
    case signUp(accessToken: String, username: String, bio: String)
}

extension SignUpService: BaseTargetType {
    var path: String {
        return URLConstant.signUpURL
    }
    
    var method: Moya.Method {
        return .patch
    }
    
    var task: Moya.Task {
        switch self {
        case .signUp(_, let username, let bio):
            return .requestJSONEncodable(["username": username, "bio": bio])

        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .signUp(let accessToken, _, _):
            return ["Content-Type": "application/json",
                    "Authorization": accessToken]
        }
    }
}
