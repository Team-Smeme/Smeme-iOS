//
//  OpenDiaryListAPI.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/11.
//

import Moya

final class OpenDiaryTotalListAPI {
    static let shared: OpenDiaryTotalListAPI = OpenDiaryTotalListAPI()
    private let openDiaryListProvider = MoyaProvider<OpenDiaryListService>(plugins: [MoyaLoggingPlugin()])
    
    private var openDiaryListTotalData: GeneralResponse<OpenDiaryListResponse>?
    
    // MARK: - getOpenDiaryTotalList
    
    func getOpenDiaryTotalList(completion: @escaping (GeneralResponse<OpenDiaryListResponse>?) -> Void) {
        openDiaryListProvider.request(.openDiaryTotalList) { response in
            switch response {
            case .success(let result):
                do {
                    self.openDiaryListTotalData = try result.map(GeneralResponse<OpenDiaryListResponse>.self)
                    completion(self.openDiaryListTotalData)
                } catch {
                    print(error)
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    // MARK: - getOpenDiarySelectList
    
    func getOpenDiarySelectList(category: Int, completion: @escaping (GeneralResponse<OpenDiaryListResponse>?) -> Void) {
        openDiaryListProvider.request(.openDiarySelectList(param: category)) { response in
            switch response {
            case .success(let result):
                do {
                    self.openDiaryListTotalData = try result.map(GeneralResponse<OpenDiaryListResponse>.self)
                    completion(self.openDiaryListTotalData)
                } catch {
                    print(error)
                }
            case .failure(let err):
                print(err)
            }
        }
    }
}
