//
//  URLConstant.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2022/12/29.
//

import Foundation

enum URLConstant {
    
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
    static let deleteMyDiaryURL = "/diaries/"
    
    // MARK: - OpenDiary
    
    static let openDiaryCategoryURL = "/categories"
    static let openDiaryTotalListURL = "/diaries"
    static let scrapOpenDirayURL = "/scraps"

    static let postDiaryURL = "/diaries"
    static let randomSubjectURL = "/categories/topic"
        
    // MARK: - MySmeme
    
    static let mySmemeURL = "/users"
    
    // MARK: - ScrapStash

    static let scrapStashListURL = "/scraps"
    static let scrapDeleteURL = "/scraps/"
}
