//
//  UITextView+.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/06.
//

import UIKit

extension UITextView {
    func setTextViewLineHeight(_ fontSize: CGFloat, _ lineHeight: CGFloat) {
        if let text = self.text {
            let style = NSMutableParagraphStyle()
            let lineHeight = fontSize * 1.09
            style.minimumLineHeight = lineHeight
            style.maximumLineHeight = lineHeight
            
            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: style,
                .baselineOffset: (lineHeight - fontSize) / 4
            ]
            
            let attributedStr = NSMutableAttributedString(string: text,
                                                          attributes: attributes)
            
            self.attributedText = attributedStr
        }
    }
}
