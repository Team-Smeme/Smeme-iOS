//
//  RandomSubjectView.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/04.
//

import UIKit

import SnapKit
import Then

struct RandomSubjectViewModel {
    var contentText: String
    var isHiddenRefreshButton: Bool
}

/**
 랜덤주제뷰를 보여주는 custom UIView
 사용법:
1.RandomSubjectView UI Property를 선언해주기
    ~~~
    private var randomSubjectView =  RandomSubjectView()
    ~~~

2.addSubView 해주기
    ~~~
    view.addSubview(randomSubjectView)
    ~~~

3.레이아웃 잡아주기 (top과 leading만 지정해줘도 됨)
    ~~~
    randomSubjectView.snp.makeConstraints {
        $0.top.equalToSuperview().inset(163)
        $0.leading.equalToSuperView()
    }
    ~~~

4.configure 설정해주기
 - contentText에 글 내용 넣어주기
 - 새로고침 버튼 유무에 따라 isHiddenRefreshButton값 넣어주기
~~~
randomSubjectView = randomSubjectView.then {
    $0.configure(with: RandomSubjectViewModel(contentText: "오늘부터 딱 일주일 후! 설레는 크리스마스네요. 일주일 전부터 세워보는 나의 크리스마스 계획은?", isHiddenRefreshButton: false))
}
~~~

5.(새로고침 버튼 있는 경우에만) 버튼 액션 추가
    ~~~
    randomSubjectView = randomSubjectView.then {
        $0.refreshSubjectContent = {
        // 로직 작성
        }
    }
    ~~~
 */
final class RandomSubjectView: UIView {
    
    // MARK: - Property
    
    var refreshSubjectContent: (() -> Void)?
    
    // MARK: - UI Property
    
    private let questionLabel = UILabel().then {
        $0.font = .body3
        $0.text = "Q."
        $0.textColor = .primary
    }
    
    var contentLabel = UILabel().then {
        $0.textAlignment = .left
        $0.font = .body4
        $0.textColor = .smemeBlack
        $0.numberOfLines = 0
        $0.lineBreakMode = .byCharWrapping
    }
    
    private let refreshButton = UIButton().then {
        $0.setImage(Constant.Image.icnRefresh, for: .normal)
        $0.addTarget(self, action: #selector(touchRefreshButton(_:)), for: .touchUpInside)
    }
    
    // MARK: - @objc
    
    @objc func touchRefreshButton(_ sender: UIButton) {
        refreshSubjectContent?()
    }
    
    // MARK: - Custom Method
    
    private func setAttribute() {
        addSubviews([questionLabel, contentLabel, refreshButton])
        
        backgroundColor = .gray100
        clipsToBounds = true
    }
    
    func configure(with viewModel: RandomSubjectViewModel) {
        contentLabel.text = "     " + viewModel.contentText
        refreshButton.isHidden = viewModel.isHiddenRefreshButton
        contentLabel.setTextWithLineHeight(lineHeight: 21)
    }
    
    override var intrinsicContentSize: CGSize {
        let heightPadding: CGFloat = refreshButton.isHidden ? 28 : 49
        
        return CGSize(width: UIScreen.main.bounds.width, height: contentLabel.frame.height + heightPadding)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        questionLabel.frame = CGRect(x: (UIScreen.main.bounds.width - 315) / 2,
                                     y: 16,
                                     width: 14,
                                     height: 17)
        contentLabel.frame = CGRect(x: (UIScreen.main.bounds.width - 315) / 2,
                                    y: 14,
                                    width: 315,
                                    height: contentLabel.calculateContentHeight(lineHeight: 21))
        refreshButton.frame = CGRect(x: (UIScreen.main.bounds.width - 315) / 2 + 315 - 22,
                                     y: 14 + contentLabel.frame.size.height + 3,
                                     width: 22,
                                     height: 22)
        
        invalidateIntrinsicContentSize()
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setAttribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
