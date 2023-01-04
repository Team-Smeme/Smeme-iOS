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
    
    private let overHeaderView = UIView()
    
    private let headerView = UIView()
    
    private let headerCornerView = UIView().then {
        $0.layer.cornerRadius = 30
        $0.layer.masksToBounds = true
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "보관함"
        $0.textColor = .black
        $0.font = .headline3
    }
    
    private let profileButton = UIButton().then {
        $0.setImage(Constant.Image.icnProfile, for: .normal)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setLayout()
        setShadow()
    }
    
    // MARK: - @objc
    
    // MARK: - Custom Method

    private func setShadow() {
        headerCornerView.layer.shadowColor = UIColor.black.cgColor
        headerCornerView.layer.shadowRadius = 18
        headerCornerView.layer.shadowOpacity = 0.04
        headerCornerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        headerCornerView.layer.masksToBounds = false
    }
    
    private func setBackgroundColor() {
        view.backgroundColor = .background
        overHeaderView.backgroundColor = .white
        headerView.backgroundColor = .white
        headerCornerView.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews([overHeaderView, headerView, headerCornerView])
        
        headerView.addSubviews([titleLabel, profileButton])
        
        overHeaderView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(headerView.snp.top)
        }
        
        headerView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(66)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
        }
        
        profileButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(13)
            $0.width.height.equalTo(40)
        }
        
        headerCornerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(convertByHeightRatio(152))
        }
    }
}
