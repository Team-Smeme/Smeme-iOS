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
        self.clipsToBounds = false
    }
}
