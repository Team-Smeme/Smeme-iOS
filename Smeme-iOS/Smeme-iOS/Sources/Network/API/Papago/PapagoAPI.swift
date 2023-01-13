//
//  PapagoAPI.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/13.
//

import Moya

final class PapagoAPI {
    static let shared: PapagoAPI = PapagoAPI()
    private let papagoProvider = MoyaProvider<PapagoService>(plugins: [MoyaLoggingPlugin()])
    
    var papagoResponse: PapagoResponse?
    
    func postDiary(param: String, completion: @escaping ((PapagoResponse)?) -> Void) {
        papagoProvider.request(.papago(param: param)) { result in
            switch result {
            case .success(let response):
                do {
                    self.papagoResponse = try response.map(PapagoResponse?.self)
                    completion(self.papagoResponse)
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
//                completion(nil, 500)
            }
            
        }
    }
}
