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
    
    /// UILabel의 line height 적용 메서드
    func countCurrentLines() -> CGFloat {
        guard let text = self.text as NSString? else { return 0 }
        guard let font = self.font              else { return 0 }
        
        var attributes = [NSAttributedString.Key: Any]()
        
        if let kernAttribute = self.attributedText?.attributes(at: 0, effectiveRange: nil).first(where: { key, _ in
            return key == .kern
        }) {
            attributes[.kern] = kernAttribute.value
        }
        attributes[.font] = font
        
        let labelTextSize = text.boundingRect(
            with: CGSize(width: self.bounds.width, height: .greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: attributes,
            context: nil
        )
        
        return CGFloat(ceil(labelTextSize.height / font.lineHeight))
    }
    
    /**
     custom line height가 적용된 label height를 구하는 함수
     - Parameters:
          - lineHeight: 적용하려고하는 custom line
     - Returns: CGFloat형식의 현재 UILabel의 높이
     ~~~
     // lineHeight가 21일 때
     let currentHeight = label.calculateContentHeight(21)
     ~~~
     */
    func calculateContentHeight(lineHeight: CGFloat) -> CGFloat {
        let numOfLines = self.countCurrentLines()
        
        return numOfLines * lineHeight
    }
}
