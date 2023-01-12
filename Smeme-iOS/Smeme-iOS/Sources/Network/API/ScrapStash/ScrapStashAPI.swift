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
    
    private var scrapStashData: GeneralResponse<ScrapedStashResponse>?
    
    func getScrapStashList(completion: @escaping (GeneralResponse<ScrapedStashResponse>?) -> Void) {
        scrapStashProvider.request(.scrapStashList) { response in
            switch response {
            case .success(let result):
                do {
                    self.scrapStashData = try result.map(GeneralResponse<ScrapedStashResponse>.self)
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

final class deleteScrapAPI {
    static let shared: deleteScrapAPI = deleteScrapAPI()
    private let deleteScrapProvider = MoyaProvider<ScrapStashService>(plugins: [MoyaLoggingPlugin()])
    
    private var deleteScrapData: GeneralResponse<ScrapedStashResponse>?
    
    func deleteScrap(completion: @escaping (GeneralResponse<ScrapedStashResponse>?) -> Void) {
        deleteScrapProvider.request(.deleteScrap) { response in
            switch response {
            case .success(let result):
                do {
                    self.deleteScrapData = try result.map(GeneralResponse<ScrapedStashResponse>.self)
                    completion(self.deleteScrapData)
                } catch {
                    print(error)
                }
            case .failure(let err):
                print(err)
            }
        }
    }
}
