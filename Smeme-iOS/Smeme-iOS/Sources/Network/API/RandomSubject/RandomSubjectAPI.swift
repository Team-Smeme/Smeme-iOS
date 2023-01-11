//
//  RandomSubjectAPI.swift
//  Smeme-iOS
//
//  Created by Joon Baek on 2023/01/11.
//

import Foundation

final class RandomSubjectAPI {
    static let shared: RandomSubjectAPI = RandomSubjectAPI
    private let randomSubjectProvider = MoyaProvider<RandomSubjectService>(plugins: [MoyaLoggingPlugin()]
    
    private var randomSubjectData: GeneralResponse<RandomSubjectResponse>?)
    
    func getRandomSubject(completion: @escaping
                          (RandomSubjectResponse<OpenDiaryCategoryResponse>?) -> Void) {
        randomSubjectProvider.request(.randomSubject) { response in
            switch response {
            case .success(let result):
                do {
                    self.randomSubjectData = try result.map(GeneralResponse<RandomSubjectResponse>.self)
                    completion(self.randomSubjectData)
                } catch {
                    print(error)
                }
            case .failure(let err):
                print(err)
            }
        }
    }
}
