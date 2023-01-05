//
//  LoginViewController.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/05.
//

import UIKit

import KakaoSDKUser

final class LoginViewController: UIViewController {
    
    // MARK: - Property
    
    // MARK: - UI Property
    
    let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
//        button.addTarget(self, action: #selector(token), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(button)
        
        button.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(100)
        }
    }
    
    // MARK: - @objc
    
//    @objc func token() {
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

}
