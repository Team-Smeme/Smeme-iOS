//
//  ScrapStashViewController.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/04.
//

import UIKit

import SnapKit
import Then

final class ScrapStashViewController: UIViewController {
    
    // MARK: - Property
    
    // MARK: - UI Property
        
    private let headerView = UIView().then {
        $0.layer.cornerRadius = 30
        $0.layer.masksToBounds = false
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowRadius = 18
        $0.layer.shadowOpacity = 0.04
        $0.layer.shadowOffset = CGSize(width: 0, height: 2)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "보관함"
        $0.textColor = .black
        $0.font = .headline3
    }
    
    private let profileButton = UIButton().then {
        $0.setImage(Constant.Image.icnProfile, for: .normal)
    }
    
    private let scrappedStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 8
        $0.alignment = .center
        $0.distribution = .fill
    }
    
    private let scrappedLabel = UILabel().then {
        $0.text = "스크랩한 표현"
        $0.textColor = .primary
        $0.font = .subtitle2
    }
    
    private let selectedUnderline = UIView().then {
        $0.backgroundColor = .primary
    }
    
    private let likedDiaryLabel = UILabel().then {
        $0.text = "추천한 일기"
        $0.textColor = .gray400
        $0.font = .subtitle2
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setLayout()
    }
    
    // MARK: - @objc
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        view.backgroundColor = .background
        headerView.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews([headerView])
        
        headerView.addSubviews([titleLabel, profileButton, scrappedStackView, likedDiaryLabel])
        
        scrappedStackView.addArrangedSubview(scrappedLabel)
        scrappedStackView.addArrangedSubview(selectedUnderline)
                
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.equalToSuperview().offset(30)
        }
        
        profileButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(13)
            $0.trailing.equalToSuperview().inset(18)
            $0.width.height.equalTo(40)
        }
        
        headerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(convertByHeightRatio(152))
        }
        
        scrappedStackView.snp.makeConstraints {
            $0.bottom.equalTo(headerView)
            $0.leading.equalToSuperview().offset(30)
        }
    
        selectedUnderline.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        likedDiaryLabel.snp.makeConstraints {
            $0.leading.equalTo(scrappedStackView.snp.trailing).offset(20)
            $0.top.equalTo(scrappedStackView)
        }
    }
}
