//
//  OpenDiaryCategoryAPI.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/11.
//

import Moya

final class OpenDiaryCategoryAPI {
    static let shared: OpenDiaryCategoryAPI = OpenDiaryCategoryAPI()
    private let openDiaryCategoryProvider = MoyaProvider<OpenDiaryCategoryService>(plugins: [MoyaLoggingPlugin()])
    
    private var openDiaryCategoryData: GeneralResponse<OpenDiaryCategoryResponse>?
    
    func getOpenDiaryCategory(completion: @escaping (GeneralResponse<OpenDiaryCategoryResponse>?) -> Void) {
        openDiaryCategoryProvider.request(.openDiaryCategory) { response in
            switch response {
            case .success(let result):
                do {
                    self.openDiaryCategoryData = try result.map(GeneralResponse<OpenDiaryCategoryResponse>.self)
                    completion(self.openDiaryCategoryData)
                } catch {
                    print(error)
                }
            case .failure(let err):
                print(err)
            }
        }
    }
}
