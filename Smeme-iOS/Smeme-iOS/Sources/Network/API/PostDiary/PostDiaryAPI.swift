//
//  PostDiaryAPI.swift
//  Smeme-iOS
//
//  Created by Joon Baek on 2023/01/11.
//

import Moya

final class PostDiaryAPI {
    static let shared: PostDiaryAPI = PostDiaryAPI()
    private let postDiaryProvider = MoyaProvider<PostDiaryService>(plugins: [MoyaLoggingPlugin()])
    
    private var postDiaryData: GeneralResponse<VoidType>?
    
    func postDiary(param: PostDiaryRequest, completion: @escaping (GeneralResponse<VoidType>?) -> Void) {
        postDiaryProvider.request(.postDiary(param: param)) { response in
            switch response {
            case .success(let result):
                do {
                    self.postDiaryData = try result.map(GeneralResponse<VoidType>.self)
                    completion(self.postDiaryData)
                } catch {
                    print(error)
                }
            case .failure(let err):
                print(err)
            }
        }
    }
}
