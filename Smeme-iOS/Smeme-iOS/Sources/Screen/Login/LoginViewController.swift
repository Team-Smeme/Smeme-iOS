//
//  LoginViewController.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/05.
//

import UIKit

import SnapKit
import Then
import KakaoSDKUser

final class LoginViewController: UIViewController {
    
    // MARK: - Property
    
    // MARK: - UI Property
    
    private let smemeLogo = UIImageView().then {
        $0.image = Constant.Image.logoSmeme
    }
    
    private let smemeServiceLable = UILabel().then {
        $0.text = """
                  일상에 스미는
                  외국어 일기
                  """
        $0.numberOfLines = 0
        $0.font = .headline2
        $0.textColor = .black
        $0.setTextWithLineHeight(lineHeight: 32)
    }
    
    private let smemeNameLabel = UILabel().then {
        $0.text = "스밈"
        $0.font = .headline1
        $0.textColor = .black
        $0.setTextWithLineHeight(lineHeight: 32)
    }
    
    private lazy var kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.setImage(Constant.Image.btnKakaoLogin, for: .normal)
//        button.addTarget(self, action: #selector(kakaoLoginApi), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setbackgroundColor()
        setLayout()
    }
    
    // MARK: - @objc
//
//    @objc func kakaoLoginApi() {
//        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
//                if let error = error {
//                    print(error)
//                }
//                else {
//                    print("loginWithKakaoAccount() success.")
//                    print("토큰 : \(oauthToken?.accessToken)")
//
//                    //do something
//                    _ = oauthToken
//                }
//            }
//    }
    
    // MARK: - Custom Method
    
    private func setbackgroundColor() {
        view.backgroundColor = .background
    }
    
    private func setLayout() {
        view.addSubviews([smemeLogo, smemeServiceLable, smemeNameLabel, kakaoLoginButton])
        
        smemeLogo.snp.makeConstraints {
            $0.top.equalToSuperview().inset(163)
            $0.leading.equalToSuperview().inset(39)
        }
        
        smemeServiceLable.snp.makeConstraints {
            $0.top.equalTo(smemeLogo.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(37)
        }
        
        smemeNameLabel.snp.makeConstraints {
            $0.leading.equalTo(smemeServiceLable.snp.trailing).inset(16)
            $0.bottom.equalTo(smemeServiceLable.snp.bottom)
        }
        
        kakaoLoginButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(constraintByNotch(158, 120))
            $0.centerX.equalToSuperview()
        }
    }
}
