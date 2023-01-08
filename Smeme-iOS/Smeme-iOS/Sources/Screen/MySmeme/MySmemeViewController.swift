//
//  MySmemeViewController.swift
//  Smeme-iOS
//
//  Created by JH on 2023/01/09.
//

import UIKit

import SnapKit
import Then

final class MySmemeViewController: UIViewController {
    
    // MARK: - Property
    
    // MARK: - UI Property
    
    private let headerContainerView = UIView()
    private let setUserInfoContainerView = UIView()
    private let setMainLanguageContainerView = UIView()
    
    private let divideLine1 = UIView().then {
        $0.backgroundColor = .gray100
    }
    
    private let previousButton = UIButton().then {
        $0.setImage(Constant.Image.icnPageLeft, for: .normal)
    }
    
    private let headerLabel = UILabel().then {
        $0.text = "나의 스밈"
        $0.font = .subtitle2
        $0.textColor = .smemeBlack
        $0.setTextWithLineHeight(lineHeight: 19)
    }
    
    private let userIdLabel = UILabel().then {
        $0.text = "주지스님"
        $0.font = .headline3
        $0.textColor = .smemeBlack
        $0.setTextWithLineHeight(lineHeight: 26)
    }
    
    private let userIntroLabel = UILabel().then {
        $0.text = "미국 거주 4년차 일기 챌린저입니다."
        $0.font = .subtitle3
        $0.textColor = .smemeBlack
        $0.textAlignment = .left
        $0.setTextWithLineHeight(lineHeight: 19)
    }
    
    private let nextButton = UIButton().then {
        $0.setImage(Constant.Image.icnPageRightDisabled, for: .normal)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setBackgroundColor()
    }
    // MARK: - @objc
    
    // MARK: - Custom Method
    
    private func setLayout() {
        
        view.addSubviews([headerContainerView,
                          setUserInfoContainerView,
                          setMainLanguageContainerView,
                          divideLine1])
        
        headerContainerView.addSubviews([previousButton, headerLabel])
        setUserInfoContainerView.addSubviews([userIdLabel, userIntroLabel, nextButton])
        
        headerContainerView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(convertByHeightRatio(66))
        }
        
        previousButton.snp.makeConstraints {
            $0.centerY.equalTo(headerContainerView)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(18)
            $0.height.equalTo(45)
        }
        
        headerLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        setUserInfoContainerView.snp.makeConstraints {
            $0.top.equalTo(headerContainerView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(convertByHeightRatio(83))
        }
        
        userIdLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(convertByHeightRatio(14))
            $0.leading.equalToSuperview().offset(30)
        }
        
        userIntroLabel.snp.makeConstraints {
            $0.top.equalTo(userIdLabel.snp.bottom).offset(10)
            $0.leading.equalTo(userIdLabel)
        }
        
        nextButton.snp.makeConstraints {
            $0.centerY.equalTo(setUserInfoContainerView)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.width.equalTo(45)
        }
        
        setMainLanguageContainerView.snp.makeConstraints {
            $0.top.equalTo(setUserInfoContainerView.snp.bottom).offset(12)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(convertByHeightRatio(47))
        }
        
        divideLine1.snp.makeConstraints {
            $0.top.equalTo(setMainLanguageContainerView.snp.bottom).offset(14)
            $0.height.equalTo(1)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
        }
    }
    
    private func setBackgroundColor() {
        view.backgroundColor = .smemeWhite
        setMainLanguageContainerView.backgroundColor = .gray
    }
}
