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
    
    // MARK: - UI Property
    
    private let diaryTextLabel = UILabel().then {
        $0.text = "The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process"
        $0.font = .body1
        $0.textColor = .gray400
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
        $0.font = .caption1
        $0.textColor = .gray700
        $0.setTextWithLineHeight(lineHeight: 14)
    }
    
    private let nicknameLabel = UILabel().then {
        $0.font = .body2
        $0.textColor = .gray700
        $0.setTextWithLineHeight(lineHeight: 17)
    }

    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - @objc
    
    // MARK: - Custom Method
    
    private func setLayout() {
        addSubviews([diaryTextLabel, likeStackView, nicknameLabel])
        likeStackView.addArrangedSubview(likeButton)
        likeStackView.addArrangedSubview(likeCountLabel)
        
        diaryTextLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.bottom.equalTo(likeStackView.snp.top).offset(-15)
        }
        
        likeStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(18)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        likeCountLabel.snp.makeConstraints {
            $0.centerY.equalTo(likeStackView)
            $0.trailing.equalToSuperview().inset(18)
        }
    }
}
