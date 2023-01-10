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
    
    var isTapped: Bool = true
    
    // MARK: - UI Property
    
    private let naviView = UIView()
    private let languageView = UIView()
    
    private lazy var textView: UITextView = {
        let textView = UITextView().then {
            $0.font = .body1
            $0.text = "최소 10자이상의 외국어를 작성해주세요"
            $0.textColor = .gray400
            $0.delegate = self
        }
        return textView
    }()
    
    private var randomSubjectView = RandomSubjectView().then {
        $0.configure(with: RandomSubjectViewModel(contentText: "오늘부터 딱 일주일 후! 설레는 크리스마스네요. 일주일 전부터 세워보는 나의 크리스마스 계획은?", isHiddenRefreshButton: false))
    }
    
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
        $0.textColor = .gray500
        $0.text = "English"
    }
    
    private let languageIcon = UIImageView(image: Constant.Image.icnArrowUnder)
    
    private lazy var randomTopicButton: UIImageView = {
        let view = UIImageView(image: Constant.Image.btnRandomTopicCheckBoxDisabled)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(topikBTNDidTap(_:))) // UIImageView 클릭 제스쳐
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let publicButton = UIImageView(image: Constant.Image.btnPublicCheckBoxSelected)
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgoundColor()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showKeyboard(textView: textView)
        keyboardAddObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        keyboardRemoveObserver()
    }
    
    // MARK: - @objc
    
    @objc
    func topikBTNDidTap(_ gesture: UITapGestureRecognizer) {
        setRandomTopicButtonToggle()
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        handleKeyboardChanged(notification: notification, customView: bottomView, isActive: true)
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        handleKeyboardChanged(notification: notification, customView: bottomView, isActive: false)
    }
    
    // MARK: - Custom Method
    
    private func setBackgoundColor() {
        view.backgroundColor = .smemeWhite
    }
    
    private func setLayout() {
        view.addSubviews([naviView, randomSubjectView, textView, bottomView])
        
        naviView.addSubviews([cancelButton, languageView, completeButton])
        languageView.addSubviews([languageLabel, languageIcon])
        
        bottomView.addSubviews([randomTopicButton, publicButton])
        
        naviView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(convertByHeightRatio(66))
        }
        
        cancelButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
        }
        
        languageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
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
        
        textView.snp.makeConstraints {
            $0.top.equalTo(naviView.snp.bottom).offset(9)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
            $0.bottom.equalTo(bottomView.snp.top)
        }
        
        bottomView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(constraintByNotch(87, 53))
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
    
    private func setRandomTopicButtonToggle() {
        isTapped.toggle()
        if isTapped {
            randomTopicButton.image = Constant.Image.btnRandomTopicCheckBox
            naviView.snp.remakeConstraints {
                $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
                $0.height.equalTo(convertByHeightRatio(66))
            }
            
            textView.snp.remakeConstraints {
                $0.top.equalTo(naviView.snp.bottom).offset(9)
                $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).offset(30)
                $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
                $0.bottom.equalTo(bottomView.snp.top)
            }
            
            randomSubjectView.removeFromSuperview()
            
        } else {
            randomTopicButton.image = Constant.Image.btnRandomTopicCheckBoxSelected
            view.addSubview(randomSubjectView)
            
            languageIcon.snp.remakeConstraints {
                $0.centerY.equalToSuperview()
                $0.leading.equalTo(languageLabel.snp.trailing).offset(6)
            }
            
            randomSubjectView.snp.remakeConstraints {
                $0.top.equalTo(naviView.snp.bottom)
                $0.leading.equalToSuperview()
            }
            
            textView.snp.remakeConstraints {
                $0.top.equalTo(randomSubjectView.snp.bottom).offset(9)
                $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).offset(30)
                $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
                $0.bottom.equalTo(bottomView.snp.top)
            }
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

// MARK: - Extensions

extension DiaryForeignViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .gray400 {
            textView.text = nil
            textView.textColor = .smemeBlack
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "최소 10자이상의 외국어를 작성해주세요"
            textView.textColor = .gray400
        }
    }
}
