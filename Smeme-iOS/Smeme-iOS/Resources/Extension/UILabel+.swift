//
//  UILabel+.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/05.
//

import UIKit

extension UILabel {
    
    /// UILabel의 line height 적용 메서드
    func setTextWithLineHeight(lineHeight: CGFloat) {
       if let text = text {
           let style = NSMutableParagraphStyle()
           style.maximumLineHeight = lineHeight
           style.minimumLineHeight = lineHeight

           let attributes: [NSAttributedString.Key: Any] = [
               .paragraphStyle: style,
               .baselineOffset: (lineHeight - font.lineHeight) / 4
           ]
           
           let attrString = NSAttributedString(string: text,
                                               attributes: attributes)
           self.attributedText = attrString
       }
   }
}
