//
//  ScrapedListCollectionViewCell.swift
//  Smeme-iOS
//
//  Created by JH on 2023/01/06.
//

import UIKit

import SnapKit
import Then

protocol alertProtocol {
    func presentAlert()
}

class ScrapedListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    
    static let identifier = "UICollectionViewCell"
    var delegate: alertProtocol?
    
    // MARK: - UI Property
        
    private let scrapedExpLabel = UILabel().then {
        $0.textColor = .smemeBlack
        $0.font = .body1
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.setTextWithLineHeight(lineHeight: 21)
    }
    
    private let divideLineView = UIView().then {
        $0.backgroundColor = .gray100
    }
        
    private let icnStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 16
    }
    
    private let openBrowserButton = UIButton().then {
        $0.setImage(Constant.Image.icnBrowser, for: .normal)
        $0.isHidden = true
    }
    
    private let copyButton = UIButton().then {
        $0.setImage(Constant.Image.icnCopy, for: .normal)
        $0.isHidden = true
    }
    
    private let translateButton = UIButton().then {
        $0.setImage(Constant.Image.icnTranslate, for: .normal)
        $0.isHidden = true
    }
    
    private let deleteButton = UIButton().then {
        $0.setImage(Constant.Image.icnDelete, for: .normal)
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
    
    // MARK: - @objc
    
    
    
    // MARK: - Custom Method

    private func setBackgroundColor() {
        backgroundColor = .smemeWhite
    }
    
    private func setLayout() {
        addSubviews([scrapedExpLabel, divideLineView, icnStackView])
        
        icnStackView.addArrangedSubview(openBrowserButton)
        icnStackView.addArrangedSubview(copyButton)
        icnStackView.addArrangedSubview(translateButton)
        icnStackView.addArrangedSubview(deleteButton)
                
        scrapedExpLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.leading.trailing.equalToSuperview().inset(15)
        }
        
        divideLineView.snp.makeConstraints {
            $0.top.equalTo(scrapedExpLabel.snp.bottom).offset(16)
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview().inset(15)
        }
        
        icnStackView.snp.makeConstraints {
            $0.top.equalTo(divideLineView.snp.bottom).offset(16)
            $0.trailing.equalTo(divideLineView)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
    
    func dataBind(model: ScrapedExpressionModel) {
        scrapedExpLabel.text = model.scrapedExpression
    }
}
