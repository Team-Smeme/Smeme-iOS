//
//  UITextView+.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/06.
//

import UIKit

extension UITextView {
    /*
     1. textColor는 뷰컨에서 해당 textView 속성 정의할 때 정의해 주어야 함!
     2. 레이아웃 잡을 때 값 24로 주기 ex) $0.leading.trailing.equalToSuperview().inset(24)
     3. textView 위에 label 올릴 때의 레이아웃 ex) top.leading.equalToSuperview().inset(7)
     */
    func setLineSpacing() {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 2
        let attributes = [
            NSAttributedString.Key.paragraphStyle: style,
            NSAttributedString.Key.font: UIFont.body1
        ]
        self.textAlignment = .left
        self.sizeToFit()
        self.attributedText = NSAttributedString(string: self.text, attributes: attributes)
    }
}
