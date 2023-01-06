//
//  OpenDiaryCollectionViewCell.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/06.
//

import UIKit

import SnapKit
import Then

class OpenDiaryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Property
    
    private let categoryLabel = UILabel()
    
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
}
