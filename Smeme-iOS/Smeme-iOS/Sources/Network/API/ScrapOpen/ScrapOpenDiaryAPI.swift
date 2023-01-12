//
//  ScrapOpenDiaryAPI.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/12.
//

import Moya

final class ScrapOpenDiaryAPI {
    static let shared: ScrapOpenDiaryAPI = ScrapOpenDiaryAPI()
    private let scrapOpenDiaryProvider = MoyaProvider<ScrapOpenDirayService>(plugins: [MoyaLoggingPlugin()])
    
    private var scrapOpenDiaryData: GeneralResponse<ScrapOpenDiaryReponse>?
    
    func postScrapOpenDiary(param: ScrapRequest, completion: @escaping (GeneralResponse<ScrapOpenDiaryReponse>?) -> Void) {
        scrapOpenDiaryProvider.request(.scraps(param: param)) { response in
            switch response {
            case .success(let result):
                do {
                    self.scrapOpenDiaryData = try result.map(GeneralResponse<ScrapOpenDiaryReponse>.self)
                    completion(self.scrapOpenDiaryData)
                } catch {
                    print(error)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
