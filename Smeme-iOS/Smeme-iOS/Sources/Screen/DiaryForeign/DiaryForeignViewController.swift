//
//  DiaryForiegnViewController.swift
//  Smeme-iOS
//
//  Created by Joon Baek on 2023/01/04.
//

import UIKit

import SnapKit
import Then

final class DiaryForeignViewController: UIViewController {
    
    // MARK: - Property
    
    // MARK: - UI Property
    
    private let naviView = UIView()
    private let languageView = UIView()
    private let bottomView = UIView().then {
        $0.backgroundColor = .white
        $0.addShadow(shadowColor: .black, shadowOpacity: 0.04, shadowRadius: 16, offset: CGSize(width: 0, height: -4.0))
    }
    
    private let cancelButton = UIButton().then {
        $0.titleLabel?.font = .body1
        $0.setTitleColor(.black, for: .normal)
        $0.setTitle("취소", for: .normal)
    }
    
    private let completeButton = UIButton().then {
        $0.titleLabel?.font = .body1
        $0.setTitleColor(.black, for: .normal)
        $0.setTitle("완료", for: .normal)
    }
    
    private let languageLabel = UILabel().then {
        $0.font = .subtitle2
        $0.textColor = .black
        $0.text = "English"
    }
    
    private let languageIcon = UIImageView(image: Constant.Image.icnArrowUnder)
    private let randomTopicButton = UIImageView(image: Constant.Image.btnRandomTopicCheckBoxDisabled)
    private let publicButton = UIImageView(image: Constant.Image.btnPublicCheckBoxSelected)
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        
        hideKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        showKeyboard()
        keyboardAddObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        keyboardRemoveObserver()
    }
    
    // MARK: - @objc
    
    @objc func keyboardWillShow(_ notification: Notification) {
//        handleKeyboardChanged(notification: notification, customView: bottomView, isActive: true)
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
//        handleKeyboardChanged(notification: notification, customView: bottomView, isActive: false)
    }
    
    // MARK: - Custom Method
    private func setLayout() {
        view.backgroundColor = .white
        view.addSubviews([naviView, bottomView])
        
        naviView.addSubviews([cancelButton, languageView, completeButton])
        languageView.addSubviews([languageLabel, languageIcon])
        
        bottomView.addSubviews([randomTopicButton, publicButton])
        
        naviView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(convertByHeightRatio(66))
        }
        
        cancelButton.snp.makeConstraints {
            $0.centerY.leading.equalToSuperview().offset(30)
        }
        
        languageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.top.bottom.equalTo(cancelButton)
            $0.leading.equalTo(languageLabel)
            $0.trailing.equalTo(languageIcon)
        }
        
        completeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-30)
        }
        
        languageLabel.snp.makeConstraints {
            $0.centerY.leading.equalToSuperview()
        }
        
        languageIcon.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(languageLabel.snp.trailing).offset(6)
        }
        
        bottomView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(convertByHeightRatio(53 + 34))
        }
        
        publicButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().offset(-30)
        }

        randomTopicButton.snp.makeConstraints {
            $0.centerY.equalTo(publicButton)
            $0.trailing.equalTo(publicButton.snp.leading).offset(-16)
        }
    }
    
    private func keyboardAddObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func keyboardRemoveObserver() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
