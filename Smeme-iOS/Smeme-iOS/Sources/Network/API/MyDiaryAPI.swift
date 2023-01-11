//
//  MyDiaryAPI.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/11.
//

import Foundation

import Moya

public class MyDiaryAPI {
    
    static let shared = MyDiaryAPI()
    private let myDiaryProvider = MoyaProvider<MyDiaryService>(plugins: [MoyaLoggingPlugin()])
    
    private var myDiaryListData: GeneralArrayResponse<MyDiaryService>?
    private var myDiaryDetailData: General   Response<MyDiaryService>?
    
    func totalMyDiaryList(completion: @escaping (GeneralResponse<OpenDiaryViewController>?) -> Void) {
        myDiaryProvider.request(.totalMyDiary) { response in
            switch response {
            case .success(let result):
                do {
                    self.myDiaryListData = try result.map(GeneralArrayResponse<MyDiaryListResponse>.self)
                    completion(self.myDiaryListData)
                } catch {
                    print(error)
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func detailMyDiary(completion: @escaping (NetworkResult<Any>) -> Void) {
        myDiaryProvider.request(.detailMyDiary) { (result) in
            switch result {
            case .success(let result):
                do {
                    self.myDiaryListData = try result.map(GeneralArrayResponse<MyDiaryListResponse>.self)
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
