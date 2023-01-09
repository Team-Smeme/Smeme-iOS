//
//  LoginProfileInfoViewController.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/09.
//

import UIKit

final class LoginProfileInfoViewController: UIViewController {
    
    // MARK: - Property
    
    // MARK: - UI Property
    
    private let profileEnterinfoLabel = UILabel().then {
        $0.font = .headline3
        $0.text = "프로필 정보를 입력해 주세요"
        $0.textColor = .smemeBlack
        $0.setTextWithLineHeight(lineHeight: 26)
    }
    
    private let nickNameLabel = UILabel().then {
        $0.font = .body2
        $0.text = "닉네임"
        $0.textColor = .smemeBlack
        $0.setTextWithLineHeight(lineHeight: 17)
    }
    
    private let oneLineInfoLabel = UILabel().then {
        $0.font = .body2
        $0.text = "한 줄 소개 (선택)"
        $0.textColor = .smemeBlack
        $0.setTextWithLineHeight(lineHeight: 17)
    }
    
    private let nickNameTextField = ClearButtonTextField().then {
        $0.configure(with: ClearButtonTextFieldViewModel(placeHolderText: "닉네임을 입력해 주세요"))
    }
    
    private let oneLineInfoTextField           = ClearButtonTextField().then {
        $0.configure(with: ClearButtonTextFieldViewModel(placeHolderText: "한 줄 소개를 입력해 주세요"))
    }
    
//    private let congratulateButton = UIButton().then {
//        $0.setImage(Constant.Image., for: <#T##UIControl.State#>)
//    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setLayout()
    }
    
    // MARK: - @objc
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        view.backgroundColor = .smemeWhite
    }
    
    private func setLayout() {
        view.addSubviews([profileEnterinfoLabel, nickNameLabel, nickNameTextField, oneLineInfoLabel, oneLineInfoTextField])
        
        profileEnterinfoLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(convertByHeightRatio(76))
            $0.leading.equalToSuperview().inset(convertByWidthRatio(30))
        }
        
        nickNameLabel.snp.makeConstraints {
            $0.top.equalTo(profileEnterinfoLabel.snp.bottom).offset(convertByHeightRatio(40))
            $0.leading.equalToSuperview().inset(convertByWidthRatio(36))
        }
        
        nickNameTextField.snp.makeConstraints {
            $0.top.equalTo(nickNameLabel.snp.bottom).offset(convertByHeightRatio(10))
            $0.centerX.equalToSuperview()
        }
        
        oneLineInfoLabel.snp.makeConstraints {
            $0.top.equalTo(nickNameTextField.snp.bottom).offset(convertByHeightRatio(32))
            $0.leading.equalTo(nickNameLabel)
        }
        
        oneLineInfoTextField.snp.makeConstraints {
            $0.top.equalTo(oneLineInfoLabel.snp.bottom).offset(convertByHeightRatio(10))
            $0.centerX.equalToSuperview()
        }
    }
}
