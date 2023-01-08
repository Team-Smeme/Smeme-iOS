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
    
    private let contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }()
    
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
        $0.text = "비공개"
    }
    
    private let categoryBackgroundView = UIView().then {
        $0.backgroundColor = .primary
        $0.makeRoundCorner(cornerRadius: 10)
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
        setLayout()
    }
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        view.backgroundColor = .smemeWhite
    }
    
    private func setLayout() {
        view.addSubviews([contentScrollView, beforeButton, dotsButton])
        contentScrollView.addSubview(contentView)
        contentView.addSubviews([categoryBackgroundView, categoryLabel, contentLabel, dateLabel])
        
        contentScrollView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(headerHeightByNotch(66))
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview().inset(bottomHeightByNotch(54))
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
        
        contentView.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalTo(contentScrollView)
            $0.width.equalTo(contentScrollView)
        }
    }
}
