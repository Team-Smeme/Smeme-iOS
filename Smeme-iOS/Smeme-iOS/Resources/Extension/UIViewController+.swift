//
//  UIViewController+.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2022/12/29.
//

import UIKit

import SnapKit

extension UIViewController {
    func getDeviceWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    func getDeviceHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
    /// Constraint 설정 시 노치 유무로 기기를 대응하는 상황에서 사용
    func constraintByNotch(_ hasNotch: CGFloat, _ noNotch: CGFloat) -> CGFloat {
        return UIScreen.main.hasNotch ? hasNotch : noNotch
    }
    
    /// 아이폰 13 미니(width 375)를 기준으로 레이아웃을 잡고, 기기의 width 사이즈를 곱해 대응 값을 구할 때 사용
    func convertByWidthRatio(_ convert: CGFloat) -> CGFloat {
        return (convert / 375) * getDeviceWidth()
    }
    
    /// 아이폰 13 미니(height 812)를 기준으로 레이아웃을 잡고, 기기의 height 사이즈를 곱해 대응 값을 구할 때 사용
    func convertByHeightRatio(_ convert: CGFloat) -> CGFloat {
        return (convert / 812) * getDeviceHeight()
    }
    
    /// 노치 유무에 따른 하단 부분 크기에 따른 높이
    func bottomHeightByNotch(_ height: CGFloat) -> CGFloat {
        return (UIScreen.main.hasNotch ? 34 : 0) + height
    }

    /// 키보드의 높이에 따라 해당 customView 위치를 변경해 주는 메서드(SE 기기대응 포함)
    func handleKeyboardChanged(notification: Notification, customView: UIView, isActive: Bool) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            let safeAreaHeight = self.view.safeAreaInsets.bottom
            
            UIView.animate(withDuration: 1) {
                customView.transform = UIScreen.main.hasNotch ? (isActive ? CGAffineTransform(translationX: 0, y: -(keyboardHeight - safeAreaHeight)) : .identity) : (isActive ? CGAffineTransform(translationX: 0, y: -keyboardHeight + 34) : .identity)
            }
        }
    }
    
    /// 화면 진입시 키보드 바로 올라오게 해 주는 메서드
    func showKeyboard(textView: UITextView) {
        textView.becomeFirstResponder()
    }
    
    /// 화면밖 터치시 키보드를 내려 주는 메서드
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
            action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    /// 토스트 메세지 메서드
    func showToast(toastMessage: String) {
        let toastBackgroundView = UIView()
        toastBackgroundView.backgroundColor = .smemeBlack?.withAlphaComponent(0.7)
        toastBackgroundView.frame = CGRect(x: 0, y: 0, width: view.frame.width - 60, height: 50)
        toastBackgroundView.center = CGPoint(x: view.frame.width/2, y: view.frame.height-73)
        toastBackgroundView.layer.cornerRadius = 6

        let toastLabel = UILabel()
        toastLabel.textColor = .smemeWhite
        toastLabel.textAlignment = .center
        toastLabel.text = toastMessage
        toastLabel.font = .body2
        toastLabel.setTextWithLineHeight(lineHeight: 17)
        
        view.addSubview(toastBackgroundView)
        toastBackgroundView.addSubview(toastLabel)
        
        toastLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
                
        UIView.animate(withDuration: 0.3, delay: 2, options: .curveEaseOut, animations: {
            toastBackgroundView.alpha = 0.0
            toastLabel.alpha = 0
        }, completion: {_ in
              toastBackgroundView.removeFromSuperview()
              toastLabel.removeFromSuperview()
          })
    }
}
