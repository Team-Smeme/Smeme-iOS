//
//  MyDiaryFloatingButton.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/07.
//

import UIKit

import SnapKit
import Then

final class MyDiaryFloatingBudttonViewController: UIViewController {
    
    // MARK: - Property
    
    private let koreanDiaryButton = IconWithTextButton().then {
        $0.isHidden = true
        $0.configure(with: IconWithTextButtonViewModel(
            image: Constant.Image.icnKorean,
            text: "한국어 일기부터 쓰기"))
    }
    private let foreignDiaryButton = IconWithTextButton().then {
        $0.isHidden = true
        $0.configure(with: IconWithTextButtonViewModel(
            image: Constant.Image.icnForeign,
            text: "바로 외국어 일기 쓰기"))
    }
    private lazy var floatingButton = UIButton().then {
        $0.isHidden = false
        $0.setImage(Constant.Image.btnPlus, for: .normal)
        $0.addTarget(self, action: #selector(floatingButtonClicked(_:)), for: .touchUpInside)
    }
    lazy var floatingDimView = UIView().then {
        $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        $0.alpha = 0
        $0.isHidden = true
    }
//    lazy var buttons: [IconTextButton] = [self.koreanButton, self.foreignButton]
    var isShowFloating = false
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setLayout()
    }
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        view.backgroundColor = .clear
    }
    
    func setLayout() {
        view.addSubviews([floatingDimView, floatingButton, koreanDiaryButton, foreignDiaryButton])
        
        floatingDimView.snp.makeConstraints {
            $0.top.trailing.bottom.leading.equalToSuperview()
        }
        
        floatingButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(136)
            $0.trailing.equalToSuperview().inset(18)
        }
    }
    
    // MARK: - @objc
    @objc func floatingButtonClicked(_ sender: UIButton) {
        if isShowFloating {
            [koreanDiaryButton, foreignDiaryButton, floatingButton].forEach { button in
                UIView.animate(withDuration: 0.3) {
                    button.isHidden = true
                    self.view.layoutIfNeeded()
                }
            }
            
            UIView.animate(withDuration: 0.5, animations: {
                self.floatingDimView.alpha = 0
            }) { (_) in
                self.floatingDimView.isHidden = true
            }
        } else {
            
            self.floatingDimView.isHidden = false
            
            UIView.animate(withDuration: 0.5) {
                self.floatingDimView.alpha = 1
            }
            
            [koreanDiaryButton, foreignDiaryButton, floatingButton].forEach { [weak self] button in
                button.isHidden = false
                button.alpha = 0
                
                UIView.animate(withDuration: 0.3) {
                    button.alpha = 1
                    self?.view.layoutIfNeeded()
                }
            }
        }
        
        isShowFloating = !isShowFloating
        
        let image = isShowFloating ? Constant.Image.btnX : Constant.Image.btnPlus
        let roatation = isShowFloating ? CGAffineTransform(rotationAngle: .pi - (.pi / 2)) : CGAffineTransform.identity
        
        UIView.animate(withDuration: 0.3) {
            sender.setImage(image, for: .normal)
            sender.transform = roatation
        }
    }
}
