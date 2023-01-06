//
//  OpenDiaryCollectionViewCell.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/06.
//

import UIKit

import SnapKit
import Then

final class OpenDiaryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    
    static let identifier = "OpenDiaryCollectionViewCell"
    
    // MARK: - UI Property
    
    let categoryLabel = UILabel().then {
        $0.font = .body1
        $0.textColor = .gray700
    }
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
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
    
    func setData(_ model: String) {
        categoryLabel.text = model
    }
}
