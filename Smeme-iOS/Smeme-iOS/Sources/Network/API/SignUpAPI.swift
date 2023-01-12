//
//  SignUpAPI.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/12.
//

import Moya

final class SignUpAPI {
    static let shared: SignUpAPI = SignUpAPI()
    private let signUpProvider = MoyaProvider<SignUpService>(plugins: [MoyaLoggingPlugin()])
    
    private var signUpData: GeneralResponse<VoidType>?
    
    func signUpSmeme(accessToken: String, username: String, bio: String, completion: @escaping (GeneralResponse<VoidType>?) -> Void) {
        signUpProvider.request(.signUp(accessToken: accessToken, username: username, bio: bio)) { response in
            switch response {
            case .success(let result):
                do {
                    self.signUpData = try result.map(GeneralResponse<VoidType>.self)
                    completion(self.signUpData)
                } catch {
                    print(error)
                }
            case .failure(let err):
                print(err)
            }
        }
    }
}
