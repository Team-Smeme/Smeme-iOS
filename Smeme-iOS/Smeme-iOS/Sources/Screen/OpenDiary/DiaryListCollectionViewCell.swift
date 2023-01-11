//
//  DiaryListCollectionViewCell.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/07.
//

import UIKit

import SnapKit
import Then

final class DiaryListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    
    static let identifier = "DiaryListCollectionViewCell"
    
    // MARK: - UI Property
    
    let diaryTextLabel = UILabel().then {
        $0.font = .body1
        $0.textColor = .smemeBlack
        $0.numberOfLines = 0
        $0.setTextWithLineHeight(lineHeight: 21)
    }
    
    private let likeStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .fill
        $0.spacing = 4
    }
    
    private let likeButton = UIButton().then {
        $0.setImage(Constant.Image.icnLike, for: .normal)
    }
    
    private let likeCountLabel = UILabel().then {
        $0.text = "0"
        $0.font = .caption1
        $0.textColor = .gray700
        $0.setTextWithLineHeight(lineHeight: 14)
    }
    
    private let nicknameLabel = UILabel().then {
        $0.text = "작성자 닉네임"
        $0.font = .body2
        $0.textColor = .gray700
        $0.setTextWithLineHeight(lineHeight: 17)
    }

    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBackgroundColor()
        setLayout()
        makeRoundCorner(cornerRadius: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - @objc
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        backgroundColor = .smemeWhite
    }
    
    private func setLayout() {
        addSubviews([diaryTextLabel, likeStackView, nicknameLabel])
        likeStackView.addArrangedSubview(likeButton)
        likeStackView.addArrangedSubview(likeCountLabel)
        
        diaryTextLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.trailing.equalToSuperview().inset(18)
        }
        
        likeStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(18)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        likeButton.snp.makeConstraints {
            $0.width.height.equalTo(18)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.centerY.equalTo(likeStackView)
            $0.trailing.equalToSuperview().inset(18)
        }
    }
    
    func setData(_ model: DiaryList) {
        diaryTextLabel.text = limitTextCount(diaryText: model.content, limitNumber: 145)
        likeCountLabel.text = String(model.likeCnt)
        nicknameLabel.text = model.username
//        hasLike
//        isSeen
    }
}
