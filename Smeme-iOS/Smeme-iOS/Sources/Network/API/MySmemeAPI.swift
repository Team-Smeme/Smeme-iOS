//
//  ScrapStashAPI.swift
//  Smeme-iOS
//
//  Created by JH on 2023/01/12.
//

import Moya

final class MySmemeAPI {
    static let shared: MySmemeAPI = MySmemeAPI()
    private let mySmemeProvider = MoyaProvider<MySmemeService>(plugins: [MoyaLoggingPlugin()])
    
    private var mySmemeData: GeneralResponse<MySmemeResponse>?
    
    func getMySmeme(completion: @escaping (GeneralResponse<MySmemeResponse>?) -> Void) {
        mySmemeProvider.request(.userInfo) { response in
            switch response {
            case .success(let result):
                do {
                    self.mySmemeData = try result.map(GeneralResponse<MySmemeResponse>.self)
                    completion(self.mySmemeData)
                } catch {
                    print(error)
                }
            case .failure(let err):
                print(err)
            }
        }
    }
}
