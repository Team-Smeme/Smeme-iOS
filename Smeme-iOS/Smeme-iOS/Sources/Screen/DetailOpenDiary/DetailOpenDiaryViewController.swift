//
//  DetailOpenDiaryViewController.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/08.
//

import UIKit

import SnapKit
import Then

final class DetailOpenDiaryViewController: UIViewController {
    
    // MARK: - Property
    
    // MARK: - UI Property
    
    private let headerView = UIView()
    private let diaryContentScrollView = UIScrollView()
    private let contentView = UIView()

    private lazy var backButton = UIButton().then {
        $0.setImage(Constant.Image.icnPageLeft, for: .normal)
    }
    
    private let bottomView = UIView().then {
        $0.backgroundColor = .white
        $0.addShadow(shadowColor: UIColor.black, shadowOpacity: 0.04, shadowRadius: 20, offset: CGSize(width: 0, height: -9))
    }
    
    private lazy var likeButton = UIButton().then {
        $0.setImage(Constant.Image.icnLike, for: .normal)
    }
    
    private let likeCountLabel = UILabel().then {
        $0.text = "0"
        $0.font = .body2
        $0.textColor = .smemeBlack
        $0.setTextWithLineHeight(lineHeight: 17)
    }
    
    private lazy var translateButton = UIButton().then {
        $0.setImage(Constant.Image.btnTranslate, for: .normal)
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
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews([headerView, diaryContentScrollView, bottomView])
        headerView.addSubview(backButton)
        diaryContentScrollView.addSubview(contentView)
        bottomView.addSubviews([likeButton, likeCountLabel, translateButton])
        
        headerView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(66)
        }
        
        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(18)
        }
        
        diaryContentScrollView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(bottomView.snp.top)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(diaryContentScrollView.contentLayoutGuide)
            $0.width.equalTo(diaryContentScrollView.snp.width)
            $0.height.greaterThanOrEqualTo(diaryContentScrollView.snp.height).priority(.low)
        }
        
        bottomView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(bottomHeightByNotch(59))
        }
        
        likeButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(17)
            $0.leading.equalToSuperview().inset(30)
        }
        
        likeCountLabel.snp.makeConstraints {
            $0.centerY.equalTo(likeButton)
            $0.leading.equalTo(likeButton.snp.trailing).offset(4)
        }
        
        translateButton.snp.makeConstraints {
            $0.centerY.equalTo(likeButton)
            $0.trailing.equalToSuperview().inset(30)
        }
    }
}
