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
}
