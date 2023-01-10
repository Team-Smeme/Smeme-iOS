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
    private let termsContainerView = UIView()
    private let versionContainerView = UIView()
    private let userStatusContainerView = UIView()
    
    private let divideLineFirst = UIView().then {
        $0.backgroundColor = .gray100
    }
    
    private let divideLineSecond = UIView().then {
        $0.backgroundColor = .gray100
    }
    
    private lazy var previousButton = UIButton().then {
        $0.setImage(Constant.Image.icnPageLeft, for: .normal)
        $0.addTarget(self, action: #selector(touchupBackButton), for: .touchUpInside)
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
    
    private let setLanguageTitleLabel = UILabel().then {
        $0.text = "주 사용 언어"
        $0.font = .subtitle3
        $0.textColor = .smemeBlack
        $0.textAlignment = .left
        $0.setTextWithLineHeight(lineHeight: 19)
    }
    
    private let languageTypeLabel = UILabel().then {
        $0.text = "English"
        $0.font = .subtitle3
        $0.textColor = .primary
        $0.textAlignment = .left
        $0.setTextWithLineHeight(lineHeight: 19)
    }
    
    private let communityTermsLabel = UILabel().then {
        $0.text = "커뮤니티 이용 규칙"
        $0.font = .subtitle3
        $0.textColor = .gray500
        $0.textAlignment = .left
        $0.setTextWithLineHeight(lineHeight: 19)
    }
    
    private let serviceTermsLabel = UILabel().then {
        $0.text = "서비스 이용 약관"
        $0.font = .subtitle3
        $0.textColor = .gray500
        $0.textAlignment = .left
        $0.setTextWithLineHeight(lineHeight: 19)
    }
    
    private let personalInfoTermsLabel = UILabel().then {
        $0.text = "개인정보 처리 방침"
        $0.font = .subtitle3
        $0.textColor = .gray500
        $0.textAlignment = .left
        $0.setTextWithLineHeight(lineHeight: 19)
    }
    
    private let versionTitleLabel = UILabel().then {
        $0.text = "앱 버전"
        $0.font = .subtitle3
        $0.textColor = .gray500
        $0.textAlignment = .left
        $0.setTextWithLineHeight(lineHeight: 19)
    }
    
    private let updateVersionLabel = UILabel().then {
        $0.text = "최신버전 업데이트"
        $0.font = .body2
        $0.textColor = .gray500
        $0.textAlignment = .left
        $0.setTextWithLineHeight(lineHeight: 17)
    }
    
    private let updateButton = UIButton().then {
        $0.setImage(Constant.Image.icnPageRightDisabled, for: .normal)
    }
    
    private let versionInfoLabel = UILabel().then {
        $0.text = "1.0"
        $0.font = .subtitle3
        $0.textColor = .primary
        $0.textAlignment = .left
        $0.setTextWithLineHeight(lineHeight: 19)
    }
    
    private let logoutLabel = UILabel().then {
        $0.text = "로그아웃"
        $0.font = .subtitle3
        $0.textColor = .gray500
        $0.textAlignment = .left
        $0.setTextWithLineHeight(lineHeight: 19)
    }
    
    private let leaveLabel = UILabel().then {
        $0.text = "탈퇴하기"
        $0.font = .subtitle3
        $0.textColor = .gray500
        $0.textAlignment = .left
        $0.setTextWithLineHeight(lineHeight: 19)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setBackgroundColor()
    }
    // MARK: - @objc
    
    @objc
    private func touchupBackButton() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else { self.navigationController?.popViewController(animated: true)
        }
    }

    // MARK: - Custom Method
    
    private func setLayout() {
                
        view.addSubviews([headerContainerView,
                          setUserInfoContainerView,
                          setMainLanguageContainerView,
                          divideLineFirst,
                          termsContainerView,
                          versionContainerView,
                          divideLineSecond,
                          userStatusContainerView])
        
        headerContainerView.addSubviews([previousButton, headerLabel])
        setUserInfoContainerView.addSubviews([userIdLabel, userIntroLabel, nextButton])
        setMainLanguageContainerView.addSubviews([setLanguageTitleLabel, languageTypeLabel])
        termsContainerView.addSubviews([communityTermsLabel, serviceTermsLabel, personalInfoTermsLabel])
        versionContainerView.addSubviews([versionTitleLabel, updateVersionLabel, updateButton, versionInfoLabel])
        userStatusContainerView.addSubviews([logoutLabel, leaveLabel])
        
        // 헤더 컨테이너 뷰
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
        
        // 프로필 설정 컨테이너 뷰
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
        
        // 주 사용 언어 컨테이너 뷰
        setMainLanguageContainerView.snp.makeConstraints {
            $0.top.equalTo(setUserInfoContainerView.snp.bottom).offset(12)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(convertByHeightRatio(47))
        }
        
        setLanguageTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
        }
        
        languageTypeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(30)
        }
        
        divideLineFirst.snp.makeConstraints {
            $0.top.equalTo(setMainLanguageContainerView.snp.bottom).offset(14)
            $0.height.equalTo(1)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
        }
        
        // 정책,규칙 컨테이너 뷰
        termsContainerView.snp.makeConstraints {
            $0.top.equalTo(divideLineFirst.snp.bottom).offset(14)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(convertByHeightRatio(141))
        }
        
        serviceTermsLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(30)
        }
        
        communityTermsLabel.snp.makeConstraints {
            $0.centerY.equalTo(serviceTermsLabel).offset(convertByHeightRatio(-47))
            $0.leading.equalTo(serviceTermsLabel)
        }
        
        personalInfoTermsLabel.snp.makeConstraints {
            $0.centerY.equalTo(serviceTermsLabel).offset(convertByHeightRatio(47))
            $0.leading.equalTo(serviceTermsLabel)
        }
        
        // 버전 컨테이너 뷰
        versionContainerView.snp.makeConstraints {
            $0.top.equalTo(termsContainerView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(convertByHeightRatio(71))
        }
        
        versionTitleLabel.snp.makeConstraints {
            $0.top.equalTo(termsContainerView.snp.bottom).offset(convertByHeightRatio(14))
            $0.leading.equalToSuperview().offset(30)
        }
        
        updateVersionLabel.snp.makeConstraints {
            $0.top.equalTo(versionTitleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(30)
        }
        
        updateButton.snp.makeConstraints {
            $0.centerY.equalTo(updateVersionLabel)
            $0.leading.equalTo(updateVersionLabel.snp.trailing).offset(-3)
            $0.height.equalTo(20 * 1.3)
            $0.width.equalTo(20 * 1.3)
        }
        
        versionInfoLabel.snp.makeConstraints {
            $0.centerY.equalTo(versionTitleLabel)
            $0.trailing.equalToSuperview().inset(30)
        }
        
        divideLineSecond.snp.makeConstraints {
            $0.top.equalTo(versionContainerView.snp.bottom).offset(convertByHeightRatio(14))
            $0.height.equalTo(1)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
        }
        
        // 로그아웃, 탈퇴 컨테이너 뷰
        userStatusContainerView.snp.makeConstraints {
            $0.top.equalTo(divideLineSecond.snp.bottom).offset(convertByHeightRatio(14))
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(convertByHeightRatio(94))
        }
        
        logoutLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(convertByHeightRatio(14))
            $0.leading.equalToSuperview().offset(30)
        }
        
        leaveLabel.snp.makeConstraints {
            $0.top.equalTo(logoutLabel).offset(convertByHeightRatio(47))
            $0.leading.equalTo(logoutLabel)
        }
    }
    
    private func setBackgroundColor() {
        view.backgroundColor = .smemeWhite
    }
}
