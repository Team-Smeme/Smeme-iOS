//
//  MyDiaryAPI.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/11.
//

import Moya

final class MyDiaryAPI {
    
    static let shared = MyDiaryAPI()
    private let myDiaryProvider = MoyaProvider<MyDiaryService>(plugins: [MoyaLoggingPlugin()])
    
    private var myDiaryListData: GeneralResponse<MyDiaryListResponse>?
    private var myDiaryDetailData: GeneralResponse<MyDiaryDetailResponse>?
    private var deleteMyDiaryData: GeneralResponse<MyDiaryDetailResponse>?
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
    
    func detailMyDiaryList(diaryId: Int, completion: @escaping (GeneralResponse<MyDiaryDetailResponse>?) -> Void) {
        myDiaryProvider.request(.detailMyDiary(diaryId: diaryId)) { response in
            switch response {
            case .success(let result):
                do {
                    self.myDiaryDetailData = try result.map(GeneralResponse<MyDiaryDetailResponse>.self)
                    completion(self.myDiaryDetailData)
                } catch {
                    print(error)
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func deleteMyDiaryList(diaryId: Int, completion: @escaping (GeneralResponse<MyDiaryDetailResponse>?) -> Void) {
        myDiaryProvider.request(.deleteDiary(diaryId: diaryId)) { response in
            switch response {
            case .success(let result):
                do {
                    self.deleteMyDiaryData = try result.map(GeneralResponse<MyDiaryDetailResponse>.self)
                    completion(self.deleteMyDiaryData)
                } catch {
                    print(error)
                }
            case .failure(let err):
                print(err)
            }
        }
    }
}
