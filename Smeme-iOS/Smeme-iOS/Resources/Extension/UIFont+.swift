//
//  UIFont+.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2022/12/29.
//

import UIKit

extension UIFont {
    
    // MARK: - Pretendard
    
    public enum PretendardType: String {
        case Bold = "Bold"
        case regular = "Regular"
    }
    
    static func Pretandard(_ type: PretendardType, size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-\(type.rawValue)", size: size)!
    }
    
}

// MARK: - Font StyleGuide

extension UIFont {
    
    class var headline1: UIFont {
        return UIFont(name: "Pretendard-Bold", size: 26.0)!
    }
    
    class var headline2: UIFont {
        return UIFont(name: "Pretendard-Regular", size: 26.0)!
    }
    
    class var headline3: UIFont {
        return UIFont(name: "Pretendard-Bold", size: 22.0)!
    }
    
    class var subtitle1: UIFont {
        return UIFont(name: "Pretendard-Bold", size: 18.0)!
    }
    
    class var subtitle2: UIFont {
        return UIFont(name: "Pretendard-Bold", size: 16.0)!
    }
    
    class var subtitle3: UIFont {
        return UIFont(name: "Pretendard-Regular", size: 16.0)!
    }
    
    class var body1: UIFont {
        return UIFont(name: "Pretendard-Regular", size: 16.0)!
    }
    
    class var body2: UIFont {
        return UIFont(name: "Pretendard-Regular", size: 14.0)!
    }
    
    class var body3: UIFont {
        return UIFont(name: "Pretendard-Bold", size: 14.0)!
    }
    
    class var body4: UIFont {
        return UIFont(name: "Pretendard-Regular", size: 14.0)!
    }
    
    class var caption1: UIFont {
        return UIFont(name: "Pretendard-Regular", size: 12.0)!
    }
}
    
