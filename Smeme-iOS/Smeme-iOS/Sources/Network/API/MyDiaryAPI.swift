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
    var myDiaryProvider = MoyaProvider<MyDiaryService>()

    public init() { }
    
    func totalMyDiaryList(completion: @escaping (NetworkResult<Any>) -> Void) {
        myDiaryProvider.request(.totalMyDiary) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeTotalMyDiaryStatus(by: statusCode, data)
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func judgeTotalMyDiaryStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GeneralArrayResponse<MyDiaryListResponse>.self, from: data)
        else { return .pathErr }
        
        switch statusCode {
        case 200:
            return .success(decodedData.data ?? "None-Data")
        case 400..<500:
            return .requestErr(decodedData.message ?? "None-Message")
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}
