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
    
    var editMenuInteraction: UIEditMenuInteraction?
    
    // MARK: - UI Property
    
    private let headerView = UIView()
    private let diaryContentScrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var backButton = UIButton().then {
        $0.setImage(Constant.Image.icnPageLeft, for: .normal)
        $0.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    private let topicView = UIView().then {
        $0.backgroundColor = .primary
        $0.makeRoundCorner(cornerRadius: 4)
    }
    
    private let topicNameLabel = UILabel().then {
        $0.text = "기념일"
        $0.font = .body2
        $0.textColor = .smemeWhite
        $0.setTextWithLineHeight(lineHeight: 17)
    }
    
    private let nicknameLabel = UILabel().then {
        $0.text = "코코하는 도레미"
        $0.font = .body3
        $0.textColor = .smemeBlack
        $0.setTextWithLineHeight(lineHeight: 17)
    }
    
    private let userInfoLabel = UILabel().then {
        $0.text = "미국 거주 4년차 일기 챌린저입니다."
        $0.font = .caption1
        $0.textColor = .gray600
        $0.setTextWithLineHeight(lineHeight: 14)
    }
    
    private let randomSubjectView = RandomSubjectView().then {
        $0.configure(with: RandomSubjectViewModel(contentText: "오늘부터 딱 일주일 후! 설레는 크리스마스네요. 일주일 전부터 세워보는 나의 크리스마스 계획은?", isHiddenRefreshButton: true))
    }
    
    private lazy var diaryContentLabel = UITextView().then {
        $0.text = """
                The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process not The issue that requires the phone call we have to solve it in person.
                
                needed...The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process not........
                
                solve it in person but sometimes some violence is needed... I was just the part of the process not The issue that requires the phone call we have to solve it in person but sometimes some violence is needed... (661)
                """
        $0.isEditable = false
        $0.isScrollEnabled = false
        $0.font = .body1
        $0.textColor = .black
        $0.tintColor = .primary
        $0.setLineSpacing()
    }
    
    private let dateLabel = UILabel().then {
        $0.text = "2022년 12월 24일 23:19"
        $0.font = .body2
        $0.textColor = .gray500
        $0.setTextWithLineHeight(lineHeight: 17)
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
        setTabbarHidden()
        setTextViewDelegate()
    }
    
    // MARK: - @objc
    
    @objc func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setTabbarHidden() {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    private func setTextViewDelegate() {
        diaryContentLabel.delegate = self
    }
    
    private func setLayout() {
        view.addSubviews([headerView, diaryContentScrollView, bottomView])
        headerView.addSubview(backButton)
        diaryContentScrollView.addSubview(contentView)
        contentView.addSubviews([topicView, nicknameLabel, userInfoLabel, randomSubjectView, diaryContentLabel, dateLabel])
        topicView.addSubview(topicNameLabel)
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
            $0.width.equalTo(diaryContentScrollView.frameLayoutGuide)
            $0.height.equalTo(diaryContentScrollView.frameLayoutGuide).priority(.low)
            $0.height.greaterThanOrEqualTo(view.snp.height).priority(.low)
        }
        
        topicView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.leading.equalToSuperview().inset(30)
            $0.bottom.equalTo(nicknameLabel.snp.top).offset(-14)
            $0.height.equalTo(convertByHeightRatio(29))
            $0.width.equalTo(topicNameLabel.intrinsicContentSize.width + 16)
        }
        
        topicNameLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(30)
            $0.bottom.equalTo(userInfoLabel.snp.top).offset(-4)
        }
        
        userInfoLabel.snp.makeConstraints {
            $0.leading.equalTo(nicknameLabel)
            $0.bottom.equalTo(randomSubjectView.snp.top).offset(-20)
        }
        
        randomSubjectView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalTo(diaryContentLabel.snp.top).offset(-10)
        }
        
        diaryContentLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalTo(contentView).offset(-calculateScrollViewHeightOffset(defaultHeight: 52, heightOfBottomView: 59, paddingOfNaviWithContent: 192, paddingOfContentWithDate: 0))
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(diaryContentLabel.snp.bottom)
            $0.trailing.equalToSuperview().inset(30)
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

// MARK: - ScrollView Height Calculate Method

extension DetailOpenDiaryViewController {
    func calculateScrollViewHeightOffset(defaultHeight: CGFloat, heightOfBottomView: CGFloat, paddingOfNaviWithContent: CGFloat, paddingOfContentWithDate: CGFloat) -> CGFloat {
        let dummyLabel = UILabel().then {
            $0.font = .body1
            $0.numberOfLines = 0
            $0.text = diaryContentLabel.text
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
        diaryContentScrollView.isScrollEnabled = isEnoughToScroll
        
        return isEnoughToScroll ? defaultHeight : (heightOfScrollView - contentSize)
    }
}

// MARK: - UIEditMenuInteractionDelegate

extension DetailOpenDiaryViewController: UIEditMenuInteractionDelegate, UITextViewDelegate {
    func textView(_ textView: UITextView, editMenuForTextIn range: NSRange, suggestedActions: [UIMenuElement]) -> UIMenu? {
        var additionalActions: [UIMenuElement] = []

        if textView.selectedRange.length > 0 {
            let highlightAction = [UIAction(title: "Smeme 🧡") { _ in
                if !(textView.selectedTextRange?.isEmpty)! {
                    let selectedString = textView.text(in: textView.selectedTextRange!)
                    guard let selectedString = selectedString else { return }
                    print("select : \(selectedString)")
                }
            }]
            additionalActions.append(contentsOf: highlightAction)
        }
        
        return UIMenu(children: additionalActions)
    }
}
