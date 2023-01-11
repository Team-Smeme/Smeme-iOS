//
//  ScrapStashAPI.swift
//  Smeme-iOS
//
//  Created by JH on 2023/01/12.
//

import Moya

final class ScrapStashAPI {
    static let shared: ScrapStashAPI = ScrapStashAPI()
    private let scrapStashProvider = MoyaProvider<ScrapStashService>(plugins: [MoyaLoggingPlugin()])
    
    private var scrapStashData: GeneralResponse<ScrapedExpressionResponse>?
    
    func getScrapStashList(completion: @escaping (GeneralResponse<ScrapedExpressionResponse>?) -> Void) {
        scrapStashProvider.request(.scrapStashList) { response in
            switch response {
            case .success(let result):
                do {
                    self.scrapStashData = try result.map(GeneralResponse<ScrapedExpressionResponse>.self)
                    completion(self.scrapStashData)
                } catch {
                    print(error)
                }
            case .failure(let err):
                print(err)
            }
        }
    }
}
