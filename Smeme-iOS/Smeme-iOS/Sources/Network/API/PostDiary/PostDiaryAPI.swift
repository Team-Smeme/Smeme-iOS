//
//  PostDiaryAPI.swift
//  Smeme-iOS
//
//  Created by Joon Baek on 2023/01/11.
//

import Moya

final class PostDiaryAPI {
    static let shared = postDiaryAPI = PostDiaryAPI()
    private let postDiaryProvider = MoyaProvider<PostDiaryService>
    (plugins: [MoyaLoggingPlugin])
    
    private var postDiaryData: GeneralResponse<PostDiaryResponse>?
    
    func postDiary(completion: @escaping
                   (GeneralResponse<PostDiaryResponse>?) -> Void) {
        postDiaryProvider.request(.postDiary) { response in
            switch response {
            case .success(let result):
                do {
                    self.postDiaryData = try
                    result.map(GeneralResponse<PostDiaryResponse>
                        .self)
                    complention(self.postDiaryData)
                } catch {
                    print(error)
                }
            case .failure(let err):
                print(err)
            }
        }
    }
}
