//
//  ScrapedListCollectionViewCell.swift
//  Smeme-iOS
//
//  Created by JH on 2023/01/06.
//

import UIKit

import SnapKit
import Then

class ScrapedListCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier
    
    static let identifier = "UICollectionViewCell"
    
    // MARK: - UI Property
    
    private let cellContainerView = UIView().then {
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .white
    }
    
    private let scrapedExpLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .body1
        $0.numberOfLines = 0
    }
    
    private let divideLineView = UIView()
    
    private let icnStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 16
    }
    
    private let openBrowserButton = UIButton().then {
        $0.setImage(Constant.Image.icnBrowser, for: .normal)
    }
    
    private let copyButton = UIButton().then {
        $0.setImage(Constant.Image.icnCopy, for: .normal)
    }
    
    private let translateButton = UIButton().then {
        $0.setImage(Constant.Image.icnTranslate, for: .normal)
    }

    private let deleteButton = UIButton().then {
        $0.setImage(Constant.Image.icnDelete, for: .normal)
    }

    
    // MARK: - Life Cycle
    
    // MARK: - @objc
    
    // MARK: - Custom Method
}
