//
//  OpenDiaryCollectionViewCell.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/06.
//

import UIKit

import SnapKit
import Then

final class TopicCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    
    static let identifier = "TopicCollectionViewCell"
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                backgroundColor = .primary
                categoryLabel.textColor = .smemeWhite
            } else {
                backgroundColor = .gray100
                categoryLabel.textColor = .gray700
            }
        }
    }
    
    // MARK: - UI Property
    
    let categoryLabel = UILabel().then {
        $0.textColor = .gray700
    }
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        setBackgroundColor()
        makeRoundCorner(cornerRadius: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func setLayout() {
        addSubview(categoryLabel)
        
        categoryLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func setBackgroundColor() {
        backgroundColor = .gray100
    }
    
    func setData(_ model: String) {
        categoryLabel.text = model
    }
}
