//
//  StepOneKoreanDiaryViewController.swift
//  Smeme-iOS
//
//  Created by Joon Baek on 2023/01/09.
//

import UIKit

import SnapKit
import Then

final class StepOneKoreanDiaryViewController: UIViewController {
    
    // MARK: - Property
    
    // MARK: - UI Property
    
    private let naviView = UIView()
    private let languageView = UIView()
    
    private lazy var textView: UITextView = {
        let textView = UITextView().then {
            $0.font = .body1
            $0.text = "최소 10자이상 작성해주세요"
            $0.textColor = .gray500
//            $0.delegate = self
        }
        return textView
    }()
    
    private var randomSubjectView = RandomSubjectView().then {
        $0.configure(with: RandomSubjectViewModel(contentText: "오늘부터 딱 일주일 후! 설레는 크리스마스네요. 일주일 전부터 세워보는 나의 크리스마스 계획은?", isHiddenRefreshButton: false))
    }
    
    private let cancelButton = UIButton().then {
        $0.titleLabel?.font = .body1
        $0.setTitleColor(.smemeBlack, for: .normal)
        $0.titleLabel?.setTextWithLineHeight(lineHeight: 21)
        $0.setTitle("취소", for: .normal)
    }
    
    private let completeButton = UIButton().then {
        $0.titleLabel?.font = .body1
        $0.setTitleColor(.smemeBlack, for: .normal)
        $0.titleLabel?.setTextWithLineHeight(lineHeight: 21)
        $0.setTitle("다음", for: .normal)
    }
    
    private let languageLabel = UILabel().then {
        $0.font = .subtitle2
        $0.textColor = .smemeBlack
        $0.setTextWithLineHeight(lineHeight: 19)
        $0.text = "한국어"
    }
    
    private let stepLabel = UILabel().then {
        $0.font = .caption1
        $0.textColor = .gray400
        $0.setTextWithLineHeight(lineHeight: 14)
        $0.text = "STEP 1"
    }
    
    private let tipLabel = UILabel().then {
        $0.font = .body2
        $0.textColor = .gray600
        $0.setTextWithLineHeight(lineHeight: 17)
        $0.text = "TIP 정확한 힌트를 받고 싶다면? 문장을 정리해보세요!"
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
        view.addSubviews([naviView, tipLabel, textView])
        
        naviView.addSubviews([cancelButton, languageView, completeButton])
        languageView.addSubviews([languageLabel, stepLabel])
        
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
            $0.trailing.equalTo(languageLabel)
        }
        
        completeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-30)
        }
        
        languageLabel.snp.makeConstraints {
            $0.centerY.leading.equalToSuperview()
        }
        
        stepLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(languageLabel.snp.bottom).offset(2)
        }
        
        tipLabel.snp.makeConstraints {
            $0.top.equalTo(naviView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(30)
        }
        
        textView.snp.makeConstraints {
            $0.top.equalTo(tipLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
            $0.bottom.equalToSuperview()
        }
    }
}
