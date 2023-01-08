//
//  DetailMyDiaryViewController.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/08.
//

import UIKit

final class DetailMyDiaryViewController: UIViewController {
    
    // MARK: - Property
    
    var myDiaryDetail = MyDiaryDetail(content: "", category: "기념일", topic: "", isPublic: false, createdAt: "00:00", likeCnt: 0)
    
    // MARK: - UI Property
    
    private let contentView = UIView()
    private let contentScrollView = UIScrollView()
    
    private lazy var beforeButton = UIButton().then {
        $0.setImage(Constant.Image.icnPageLeft, for: .normal)
        $0.addTarget(self, action: #selector(touchBeforeButton(_:)), for: .touchUpInside)
    }
    
    private lazy var dotsButton = UIButton().then {
        $0.setImage(Constant.Image.icnSetting, for: .normal)
        $0.addTarget(self, action: #selector(touchDotsButton(_:)), for: .touchUpInside)
    }
    
    private let categoryLabel = UILabel().then {
        $0.textColor = .smemeWhite
        $0.font = .body2
        $0.sizeToFit()
        $0.setTextWithLineHeight(lineHeight: 17)
    }
    
    private let publicLabel = UILabel().then {
        $0.textColor = .gray500
        $0.font = .body2
        $0.setTextWithLineHeight(lineHeight: 17)
        $0.text = "공개"
    }
    
    private let categoryBackgroundView = UIView().then {
        $0.backgroundColor = .primary
        $0.sizeToFit()
        $0.makeRoundCorner(cornerRadius: 4)
    }
    
    private let contentLabel = UILabel().then {
        $0.textColor = .smemeBlack
        $0.font = .body1
        $0.numberOfLines = 0
        $0.setTextWithLineHeight(lineHeight: 21)
    }
    
    private let dateLabel = UILabel().then {
        $0.textColor = .gray500
        $0.font = .body2
        $0.setTextWithLineHeight(lineHeight: 17)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setData()
        setTabbarHidden()
        setLayout()
    }
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        view.backgroundColor = .smemeWhite
    }
    
    private func setTabbarHidden() {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    private func setData() {
        publicLabel.isHidden = !myDiaryDetail.isPublic
        categoryLabel.text = myDiaryDetail.category
        contentLabel.text = myDiaryDetail.content + " (\(myDiaryDetail.content.count))"
        contentLabel.setTextWithLineHeight(lineHeight: 21)
        dateLabel.text = myDiaryDetail.createdAt.getFormattedDate(format: "yyyy년 MM월 dd일 HH:mm")
    }
    
    private func setLayout() {
        view.addSubviews([contentScrollView, beforeButton, dotsButton])
        contentScrollView.addSubview(contentView)
        contentView.addSubviews([categoryBackgroundView, categoryLabel, publicLabel, contentLabel, dateLabel])
        
        contentScrollView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(headerHeightByNotch(66))
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(bottomHeightByNotch(54))
        }
        
        contentView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(contentScrollView)
            $0.width.equalTo(contentScrollView.snp.width)
            $0.height.greaterThanOrEqualTo(view.snp.height).priority(.low)
        }
        
        beforeButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(headerHeightByNotch(10))
            $0.leading.equalToSuperview().inset(convertByWidthRatio(18))
        }
        
        dotsButton.snp.makeConstraints {
            $0.centerY.equalTo(beforeButton)
            $0.trailing.equalToSuperview().inset(convertByWidthRatio(29))
        }
    
        categoryBackgroundView.snp.makeConstraints {
            $0.top.equalTo(contentView).inset(convertByHeightRatio(15))
            $0.leading.equalTo(contentView).inset(convertByWidthRatio(30))
            $0.height.equalTo(29)
            $0.width.equalTo(categoryLabel.intrinsicContentSize.width + 16)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.center.equalTo(categoryBackgroundView)
        }
        
        publicLabel.snp.makeConstraints {
            $0.centerY.equalTo(categoryBackgroundView)
            $0.trailing.equalTo(contentView).inset(convertByWidthRatio(30))
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(categoryBackgroundView.snp.bottom).offset(convertByHeightRatio(20))
            $0.leading.equalTo(contentView).inset(convertByWidthRatio(30))
            $0.trailing.equalTo(contentView).inset(convertByWidthRatio(30))
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(convertByHeightRatio(20))
            $0.trailing.equalTo(contentView).inset(convertByWidthRatio(30))
        }
    }
    
    // MARK: - objc
    
    @objc func touchBeforeButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @objc func touchDotsButton(_ sender: UIButton) {
        
    }
}
