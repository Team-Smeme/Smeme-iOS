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
    
    private let koreanDiaryScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    private lazy var textView = UITextView().then {
        
        $0.font = .body1
        $0.text = "최소 10자이상의 외국어를 작성해주세요"
        $0.textColor = .gray400
        //            $0.delegate = self
    }
    
    private let cancelButton = UIButton().then {
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
        view.addSubviews([naviView])
        
        naviView.addSubviews([cancelButton, languageView, completeButton])
        languageView.addSubviews([languageLabel, languageIcon, stepLabel])
        
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
        
        stepLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(languageLabel.snp.bottom).offset(2)
        }
    }
}
