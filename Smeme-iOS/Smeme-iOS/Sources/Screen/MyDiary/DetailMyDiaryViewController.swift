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
