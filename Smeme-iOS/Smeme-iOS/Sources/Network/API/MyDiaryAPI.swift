//
//  MyDiaryAPI.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/11.
//

import Foundation

import Moya

final class MyDiaryAPI {
    
    static let shared = MyDiaryAPI()
    private let myDiaryProvider = MoyaProvider<MyDiaryService>(plugins: [MoyaLoggingPlugin()])
    
    private var myDiaryListData: GeneralResponse<MyDiaryListResponse>?
    
    func totalMyDiaryList(completion: @escaping (GeneralResponse<MyDiaryListResponse>?) -> Void) {
        myDiaryProvider.request(.totalMyDiary) { response in
            switch response {
            case .success(let result):
                do {
                    self.myDiaryListData = try result.map(GeneralResponse<MyDiaryListResponse>.self)
                    completion(self.myDiaryListData)
                } catch {
                    print(error)
                }
            case .failure(let err):
                print(err)
            }
        }
    }
}
