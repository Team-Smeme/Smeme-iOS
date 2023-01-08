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
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setBackgroundColor()
    }
    // MARK: - @objc
    
    // MARK: - Custom Method
    
    private func setLayout() {
        
        view.addSubviews([headerContainerView, setUserInfoContainerView, setMainLanguageContainerView, divideLine1])
        
        headerContainerView.addSubviews([previousButton])
        
        headerContainerView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(convertByHeightRatio(66))
        }
        
        setUserInfoContainerView.snp.makeConstraints {
            $0.top.equalTo(headerContainerView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(convertByHeightRatio(83))
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
        headerContainerView.backgroundColor = .blue
        setUserInfoContainerView.backgroundColor = .red
        setMainLanguageContainerView.backgroundColor = .gray
    }
}
