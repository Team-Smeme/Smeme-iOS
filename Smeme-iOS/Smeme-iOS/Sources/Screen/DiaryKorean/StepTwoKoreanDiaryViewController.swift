//
//  DiaryKoreanStepTwoViewController.swift
//  Smeme-iOS
//
//  Created by Joon Baek on 2023/01/09.
//

import UIKit

import SnapKit
import Then

final class StepTwoKoreanDiaryViewController: UIViewController {
    
    // MARK: - Property
    
    var randomTopicCheckBox: Bool?
    var publicCheckBox: Bool?
    var isPublic: Bool = true
    
    // MARK: - UI Property
    
    private let naviView = UIView()
    private let languageView = UIView()
    
    var koreanDiaryTextView = UITextView().then {
        $0.font = .body1
        $0.textColor = .smemeBlack
        //            $0.delegate = self
    }
    
    private lazy var diaryTextView = UITextView().then {
        $0.setLineSpacing()
        $0.textColor = .gray400
        $0.delegate = self
    }
    
    private let placeHolderLabel = UILabel().then {
        $0.text = "최소 10자 이상의 외국어를 작성해 주세요"
        $0.textColor = .gray400
        $0.font = .body1
        $0.setTextWithLineHeight(lineHeight: 21)
    }
    
    private lazy var backButton = UIButton().then {
        $0.setImage(Constant.Image.icnPageLeft, for: .normal)
        $0.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var completeButton = UIButton().then {
        $0.titleLabel?.font = .body1
        $0.setTitleColor(.smemeBlack, for: .normal)
        $0.titleLabel?.setTextWithLineHeight(lineHeight: 21)
        $0.setTitle("완료", for: .normal)
        $0.addTarget(self, action: #selector(compleButtonDidTap), for: .touchUpInside)
    }
    
    private let languageLabel = UILabel().then {
        $0.font = .subtitle2
        $0.textColor = .gray500
        $0.setTextWithLineHeight(lineHeight: 19)
        $0.text = "English"
    }
    
    private let languageIcon = UIImageView(image: Constant.Image.icnArrowUnder)
    
    private let stepLabel = UILabel().then {
        $0.font = .caption1
        $0.textColor = .gray400
        $0.setTextWithLineHeight(lineHeight: 14)
        $0.text = "STEP 2"
    }
    
    private let grayUnderlineView = UIView().then {
        $0.backgroundColor = .gray100
    }
    
    private let bottomView = UIView().then {
        $0.backgroundColor = .white
        $0.addShadow(shadowColor: .black, shadowOpacity: 0.04, shadowRadius: 16, offset: CGSize(width: 0, height: -4.0))
    }
    
    private let randomTopicButton = UIButton().then {
        $0.setImage(Constant.Image.btnRandomTopicCheckBox, for: .normal)
        $0.isEnabled = false
    }
    
    private lazy var publicButton = UIButton().then {
        $0.setImage(Constant.Image.btnPublicCheckBoxSelected, for: .normal)
        $0.addTarget(self, action: #selector(publicButtonDidTap), for: .touchUpInside)
    }
    
    private let hintButton = UIImageView(image: Constant.Image.btnTranslate)
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgoundColor()
        setLayout()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        randomCheckBoxPresent()
        publicCheckBoxPresent()
    }
    
    // MARK: - @objc
    
    @objc func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func compleButtonDidTap() {
        changeMainRootViewController()
    }
    
    @objc func publicButtonDidTap() {
        isPublic.toggle()
        if isPublic {
            publicButton.setImage(Constant.Image.btnPublicCheckBoxSelected, for: .normal)
        } else {
            publicButton.setImage(Constant.Image.btnPublicCheckBox, for: .normal)
        }
    }
    
    // MARK: - Custom Method
    
    private func setBackgoundColor() {
        view.backgroundColor = .smemeWhite
    }
    
    private func setLayout() {
        view.addSubviews([naviView, koreanDiaryTextView, grayUnderlineView, diaryTextView, bottomView])
        
        naviView.addSubviews([backButton, languageView, completeButton])
        diaryTextView.addSubview(placeHolderLabel)
        languageView.addSubviews([languageLabel, languageIcon, stepLabel])
        bottomView.addSubviews([randomTopicButton, publicButton, hintButton])
        
        naviView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(convertByHeightRatio(66))
        }
        
        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
        }
        
        languageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.bottom.equalTo(backButton)
            $0.leading.equalTo(languageLabel)
            $0.trailing.equalTo(languageIcon)
        }
        
        completeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-30)
        }
        
        languageLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(backButton.snp.trailing).offset(95)
        }
        
        languageIcon.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(languageLabel.snp.trailing).offset(4)
        }
        
        stepLabel.snp.makeConstraints {
            $0.top.equalTo(languageLabel.snp.bottom).offset(2)
            $0.leading.equalTo(backButton.snp.trailing).offset(105)
        }
        
        koreanDiaryTextView.snp.makeConstraints {
            $0.top.equalTo(naviView.snp.bottom)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
            $0.height.equalTo(convertByHeightRatio(110))
        }
        
        grayUnderlineView.snp.makeConstraints {
            $0.top.equalTo(koreanDiaryTextView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(convertByHeightRatio(6))
        }
        
        diaryTextView.snp.makeConstraints {
            $0.top.equalTo(grayUnderlineView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview()
        }
        
        placeHolderLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(7)
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
        
        hintButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(22)
        }
    }
    
    private func randomCheckBoxPresent() {
        if randomTopicCheckBox ?? true {
            randomTopicButton.setImage(Constant.Image.btnRandomTopicCheckBoxSelectedDisable, for: .normal)
        } else {
            randomTopicButton.setImage(Constant.Image.btnRandomTopicCheckBoxDisabled, for: .normal)
        }
    }
    
    private func publicCheckBoxPresent() {
        if randomTopicCheckBox ?? true {
            publicButton.setImage(Constant.Image.btnPublicCheckBoxSelected, for: .normal)
        } else {
            publicButton.setImage(Constant.Image.btnPublicCheckBox, for: .normal)
        }
    }
}

// MARK: - UITextViewDelegate

extension StepTwoKoreanDiaryViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            placeHolderLabel.isHidden = false
            textView.textColor = .smemeBlack
            textView.font = .body1
            textView.setLineSpacing()
            textView.tintColor = .clear
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            placeHolderLabel.isHidden = false
            textView.textColor = .smemeBlack
            textView.font = .body1
            textView.setLineSpacing()
            textView.tintColor = .clear
        } else {
            placeHolderLabel.isHidden = true
            textView.textColor = .gray400
            textView.font = .body1
            textView.setLineSpacing()
            textView.tintColor = .primary
        }
    }
}
