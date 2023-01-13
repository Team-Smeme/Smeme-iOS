//
//  MyDiaryCollectionViewCell.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/07.
//

import UIKit

import SnapKit
import Then

final class MyDiaryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    
    static let identifier = "MyDiaryCollectionViewCell"
    
    private let dateFormatter = DateFormatter().then {
        $0.dateFormat = "HH:mm"
    }
    
    // MARK: - UI Property
    
    private let timeLabel = UILabel().then {
        $0.textColor = .gray500
        $0.font = .body2
    }
    
    private let contentLabel = UILabel().then {
        $0.textColor = .smemeBlack
        $0.font = .body1
        $0.numberOfLines = 0
    }
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBackgroundColor()
        setLayout()
        makeRoundCorner(cornerRadius: 14)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        backgroundColor = .smemeWhite
    }
    
    private func setLayout() {
        addSubviews([timeLabel, contentLabel])
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(275)
        }
    
        timeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(26)
            $0.leading.equalTo(contentLabel)
        }
    }
    
    func setData(content: String, time: String) {
        contentLabel.text = limitTextCount(diaryText: content, limitNumber: 600) + " (\(content.count))"
        timeLabel.text = time.utcToLocale(dateFormat: "HH:mm")
        contentLabel.setTextWithLineHeight(lineHeight: 21)
        timeLabel.setTextWithLineHeight(lineHeight: 17)
    }
}
