//
//  String+.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/08.
//

import Foundation

extension String {
    /**
     서버에서 가져온 string형 (데이터를 date형으로 변환 후 원하는 형식의 string으로 바꿔준다.
     ~~~
     let dataFromServer: String = "2022-12-30 02:34"
     dateLabel.text = dataFromServer.getFormattedDate(format: "yyyy년 MM월 dd일 HH:mm")
     ~~~
     */
    func getFormattedDate(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" // 서버에서 오는 Date형식
        
        let convertDate = dateFormatter.date(from: self) // String을 Date타입으로 변환
        let myformatter = DateFormatter()
        myformatter.dateFormat = format
        
        let result = myformatter.string(from: convertDate!) // Date를 원하는 형식의 String으로 변환
        
        return result
    }

    func utcToLocale(dateFormat: String) -> String {
        let dfFormat = DateFormatter()
        dfFormat.dateFormat = "yyyy-MM-dd HH:mm"
        dfFormat.timeZone = TimeZone(abbreviation: "UTC")
        let dtUtcDate = dfFormat.date(from: self)
        
        dfFormat.timeZone = TimeZone.current
        dfFormat.dateFormat = dateFormat
        return dfFormat.string(from: dtUtcDate!)
    }
}
