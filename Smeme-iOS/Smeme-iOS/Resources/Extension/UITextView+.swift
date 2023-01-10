//
//  UITextView+.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/06.
//

import UIKit

extension UITextView {
    /// 레이아웃 잡을 때 값 24로 주기 ex) $0.leading.trailing.equalToSuperview().inset(24)
    func setLineSpacing() {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 2
        let attributes = [
            NSAttributedString.Key.paragraphStyle: style,
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.body1
        ]
        self.textAlignment = .left
        self.sizeToFit()
        self.attributedText = NSAttributedString(string: self.text, attributes: attributes)
    }
}
