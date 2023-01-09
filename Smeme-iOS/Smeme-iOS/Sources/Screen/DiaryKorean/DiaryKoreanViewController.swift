//
//  DiaryKoreanViewController.swift
//  Smeme-iOS
//
//  Created by Joon Baek on 2023/01/09.
//

import UIKit

import SnapKit
import Then

final class DiaryKoreanViewController: UIViewController {
    // MARK: - Property
    // MARK: - UI Property
    
    private let naviView = UIView()
    private let languageView = UIView()
    
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
    
    private let stepLabel = UILabel().then {
        $0.font = .caption1
        $0.textColor = .gray400
        $0.text = "STEP 1"
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
    }
    
}
