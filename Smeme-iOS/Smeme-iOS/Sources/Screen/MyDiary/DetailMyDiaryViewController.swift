//
//  DetailMyDiaryViewController.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/08.
//

import UIKit

final class DetailMyDiaryViewController: UIViewController {
    
    // MARK: - Property
    
    var myDiaryDetail = MyDiaryDetailResponse(content: "", category: "기념일", topic: "", isPublic: false, createdAt: "00:00", likeCnt: 0)
    
    // MARK: - UI Property
    
    private let contentView = UIView()
    private let contentScrollView = UIScrollView()
    
    private lazy var backButton = UIButton().then {
        $0.setImage(Constant.Image.icnPageLeft, for: .normal)
        $0.addTarget(self, action: #selector(backButtonDidTap(_:)), for: .touchUpInside)
    }
    
    private lazy var optionButton = UIButton().then {
        $0.setImage(Constant.Image.icnSetting, for: .normal)
        $0.addTarget(self, action: #selector(optionButtonDidTap(_:)), for: .touchUpInside)
    }
    
    private let categoryLabel = UILabel().then {
        $0.textColor = .smemeWhite
        $0.font = .body2
        $0.sizeToFit()
    }
    
    private let publicLabel = UILabel().then {
        $0.textColor = .gray500
        $0.font = .body2
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
    }
    
    private let dateLabel = UILabel().then {
        $0.textColor = .gray500
        $0.font = .body2
    }
    
    private let likeBottomView = LikeBottomView().then {
        $0.addShadow(shadowColor: .black, shadowOpacity: 0.04, shadowRadius: 20, offset: CGSize(width: 0, height: -9))
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
        likeBottomView.configure(with: LikeBottomViewModel(likeCount: myDiaryDetail.likeCnt))
    }
    
    private func setLayout() {
        view.addSubviews([contentScrollView, backButton, optionButton, likeBottomView])
        contentScrollView.addSubview(contentView)
        contentView.addSubviews([categoryBackgroundView, categoryLabel, publicLabel, contentLabel, dateLabel])
        
        contentScrollView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(headerHeightByNotch(66))
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(likeBottomView.snp.top)
        }
        
        contentView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(contentScrollView.contentLayoutGuide)
            $0.width.equalTo(contentScrollView.frameLayoutGuide)
            $0.height.equalTo(contentScrollView.frameLayoutGuide).priority(.low)
            $0.height.greaterThanOrEqualTo(view.snp.height).priority(.low)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(headerHeightByNotch(10))
            $0.leading.equalToSuperview().inset(convertByWidthRatio(18))
        }
        
        optionButton.snp.makeConstraints {
            $0.centerY.equalTo(backButton)
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
            $0.leading.trailing.equalTo(contentView).inset(convertByWidthRatio(30))
            $0.bottom.equalTo(contentView).offset(-calculateScrollViewHeightOffset(defaultHeight: 98, heightOfBottomView: 54, paddingOfNaviWithContent: 53, paddingOfContentWithDate: 20))
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(convertByHeightRatio(20))
            $0.trailing.equalTo(contentView).inset(convertByWidthRatio(30))
        }
        
        likeBottomView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    // MARK: - objc
    
    @objc func backButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @objc func optionButtonDidTap(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "삭제", style: .default, handler: {_ in
            print("삭제하기")
        }))
        actionSheet.addAction(UIAlertAction(title: "닫기", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func calculateScrollViewHeightOffset(defaultHeight: CGFloat, heightOfBottomView: CGFloat, paddingOfNaviWithContent: CGFloat, paddingOfContentWithDate: CGFloat) -> CGFloat {
        let dummyLabel = UILabel().then {
            $0.font = .body1
            $0.numberOfLines = 0
            $0.text = myDiaryDetail.content
            $0.setTextWithLineHeight(lineHeight: 21)
        }
        dummyLabel.frame = CGRect(x: 0,
                                  y: 0,
                                  width: convertByWidthRatio(315),
                                  height: dummyLabel.calculateContentHeight(lineHeight: 21))

        let expectedLabelSize = dummyLabel.calculateContentHeight(lineHeight: 21)
        let heightOfDateLabel: CGFloat = 17
        let heightOfNotch: CGFloat = 44 + 34
        let heightOfSafeArea: CGFloat = UIScreen.main.bounds.height - heightOfNotch
        let heightOfScrollView: CGFloat = heightOfSafeArea - (heightOfBottomView + 66)
        let contentSize: CGFloat = paddingOfNaviWithContent + paddingOfContentWithDate + expectedLabelSize + heightOfDateLabel
        let isEnoughToScroll: Bool = contentSize > heightOfScrollView
        contentScrollView.isScrollEnabled = isEnoughToScroll
        
        return isEnoughToScroll ? defaultHeight : (heightOfScrollView - contentSize)
    }
}
