//
//  DiaryForiegnViewController.swift
//  Smeme-iOS
//
//  Created by Joon Baek on 2023/01/04.
//

import UIKit

import Moya
import SnapKit
import Then

final class DiaryForiegnViewController: UIViewController {

    // MARK: - Property

    
    
    // MARK: - UI Property

    let naviView = UIView()
    let languageView = UIView()
    
    let cancelButton = UIButton().then {
        $0.titleLabel?.font = UIFont.body1
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.setTitle("취소", for: .normal)
        
    }
    let languageButton = UIButton()
    let completeButton = UIButton().then {
        $0.titleLabel?.font = UIFont.body1
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.setTitle("완료", for: .normal)
    }
    
    let languageLabel = UILabel().then {
        $0.font = UIFont.subtitle2
        $0.textColor = UIColor.black
        $0.text = "English"
    }
    
    let languageIcon = Constant.Image.icnArrowUnder
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()

    // MARK: - @objc
        
        
        
    // MARK: - Custom Method

        
    }
}

//MARK: - Extensions
extension DiaryForiegnViewController {
    private func layout() {
        view.backgroundColor = UIColor.background
        view.addSubviews([naviView])
        
        naviView.addSubviews([cancelButton, languageView, languageButton, completeButton])
        languageView.addSubviews([languageLabel, languageIcon])
        
        naviView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(convertByWidthRatio(66))
        }
        
        cancelButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
        }
        
        languageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(158)
        }
        
        completeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-30)
        }
        
        languageLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        languageButton.snp.makeConstraints {
            $0.edges.equalTo(self.languageView)
        }
    }
}
