//
//  DetailOpenDiaryAP.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/13.
//

import Moya

final class DetailOpenDiaryAPI {
    static let shared: DetailOpenDiaryAPI = DetailOpenDiaryAPI()
    private let detailOpenDiary = MoyaProvider<DetailOpenDiaryService>(plugins: [MoyaLoggingPlugin()])
    
    private var deatilOpenDiaryData: GeneralResponse<DetailOpenDiaryResponse>?
    
    func getDetailOpenDiaryAPI(param: Int, completion: @escaping (GeneralResponse<DetailOpenDiaryResponse>?) -> Void) {
        detailOpenDiary.request(.detailOpenDiary(param: param)) { response in
            switch response {
            case .success(let result):
                do {
                    self.deatilOpenDiaryData = try result.map(GeneralResponse<DetailOpenDiaryResponse>.self)
                    completion(self.deatilOpenDiaryData)
                } catch {
                    print(error)
                }
            case .failure(let err):
                print(err)
            }
        }
    }
}
