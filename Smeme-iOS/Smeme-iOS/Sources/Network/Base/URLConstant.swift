//
//  URLConstant.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2022/12/29.
//

import Foundation

struct URLConstant {
    
    // MARK: - Login
    
    static let socialLoginURL = "/auth"
    static let remakeTokenURL = "/auth/token"
    
    // MARK: - SignUp
    
    static let signUpURL = "/users"

    // MARK: - DiaryKorean
    
    static let writeDiaryURL = "/diaries"
    
    // MARK: - MyDiary

    static let totalMyDiaryListURL = "/users/diaries"
    static let detailMyDiaryListURL = "/users/diaries/"
    
    // MARK: - OpenDiary
    
    static let openDiaryCategoryURL = "/categories"

    static let postDiaryURL = "/diaries"
    static let randomSubjectURL = "/categories/topic"
    static let openDiaryToTalListURL = "/diaries"
        
    // MARK: - MySmeme
    
    static let mySmemeURL = "/users"
    
    // MARK: - ScrapStash

    static let scrapStashListURL = "/scraps"
    static let scrapDeleteURL = "/scraps/"
}
