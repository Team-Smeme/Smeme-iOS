//
//  Environment.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/08.
//

import Foundation

// MARK: - Environment

struct Environment {
    static let nativeAppKey = (Bundle.main.infoDictionary?["NATIVE_APP_KEY"] as! String).replacingOccurrences(of: " ", with: "")
}
