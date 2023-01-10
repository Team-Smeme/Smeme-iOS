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
    
    // MARK: - UI Property
    
    private let naviView = UIView()
    private let languageView = UIView()
    
    private lazy var koreanDiaryTextView = UITextView().then {
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
    
    private let backButton = UIButton().then {
        $0.setImage(Constant.Image.icnPageLeft, for: .normal)
    }
    
    private let completeButton = UIButton().then {
        $0.titleLabel?.font = .body1
        $0.setTitleColor(.smemeBlack, for: .normal)
        $0.titleLabel?.setTextWithLineHeight(lineHeight: 21)
        $0.setTitle("완료", for: .normal)
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
    
    private lazy var randomTopicButton: UIImageView = {
        let view = UIImageView(image: Constant.Image.btnRandomTopicCheckBoxDisabled)
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(topikBTNDidTap())
//        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let publicButton = UIImageView(image: Constant.Image.btnPublicCheckBoxSelected)
    
    private let hintButton = UIImageView(image: Constant.Image.btnTranslate)
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgoundColor()
        setLayout()
        
    }
    
    // MARK: - @objc
    
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
            $0.top.equalTo(grayUnderlineView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.bottom.equalToSuperview()
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
}
