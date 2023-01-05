//
//  DiaryForiegnViewController.swift
//  Smeme-iOS
//
//  Created by Joon Baek on 2023/01/04.
//

import UIKit

import SnapKit
import Then

final class DiaryForiegnViewController: UIViewController {
    
    // MARK: - Property
    
    // MARK: - UI Property
    
    let naviView = UIView()
    let languageView = UIView()
    
    let cancelButton = UIButton().then {
        $0.titleLabel?.font = .body1
        $0.setTitleColor(.black, for: .normal)
        $0.setTitle("취소", for: .normal)
    }
    
    let completeButton = UIButton().then {
        $0.titleLabel?.font = .body1
        $0.setTitleColor(.black, for: .normal)
        $0.setTitle("완료", for: .normal)
    }
    
    let languageLabel = UILabel().then {
        $0.font = .subtitle2
        $0.textColor = .black
        $0.text = "English"
    }
    
    let languageIcon = UIImageView(image: Constant.Image.icnArrowUnder)
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    // MARK: - @objc
    
    // MARK: - Custom Method
    private func setLayout() {
        view.backgroundColor = .white
        view.addSubviews([naviView])
        
        naviView.addSubviews([cancelButton, languageView, completeButton])
        languageView.addSubviews([languageLabel, languageIcon])
        
        naviView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(convertByWidthRatio(66))
        }
        
        cancelButton.snp.makeConstraints {
            $0.centerY.leading.equalToSuperview().offset(30)
        }
        
        languageView.snp.makeConstraints {
            $0.center.equalToSuperview()
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
    }
}

