//
//  UIView+.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2022/12/29.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
    
    /// 그림자 추가해 주는 메서드
    func addShadow(shadowColor: UIColor, shadowOpacity: Float, shadowRadius: Float, offset: CGSize) {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = CGFloat(shadowRadius)
    }
    
    /// Constraint 설정 시 노치 유무로 기기를 대응하는 상황에서 사용
    func constraintByNotch(_ hasNotch: CGFloat, _ noNotch: CGFloat) -> CGFloat {
        return UIScreen.main.hasNotch ? hasNotch : noNotch
    }
    
    /// 노치 유무에 따른 상단 Status Bar 부분 크기에 따른 높이
    func headerHeightByNotch(_ height: CGFloat) -> CGFloat {
        return (UIScreen.main.hasNotch ? 44 : 10) + height
    }
    
    /// 특정 corner radius만 값을 주는 메서드
    func makeSelectedRoundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
    
    /// 전체 corner radius 값을 주는 메서드
    func makeRoundCorner(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
    }
    
    /// label의 글자수 제한 후, ...으로 보여 주는 메서드
    func limitTextCount(diaryText: String, limitNumber: Int) -> String {
        var limitText: String = ""
        
        if diaryText.count > limitNumber {
            limitText = String(diaryText.prefix(limitNumber) + "...")
        } else if diaryText.count <= limitNumber {
            limitText = diaryText
        }
        
        return limitText
    }
}
