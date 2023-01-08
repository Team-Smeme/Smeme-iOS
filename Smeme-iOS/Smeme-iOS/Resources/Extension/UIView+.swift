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
    
    func makeSelectedRoundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
    
    func makeRoundCorner(cornerRadius: CGFloat = 4) {
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
    }
}
