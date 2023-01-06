//
//  MyDiaryDateView.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/07.
//

import UIKit

import SnapKit
import Then

class UpperBar: UIView {
    
    // MARK: - Property
    var increaseDate: (() -> Void)?
    var decreaseDate: (() -> Void)?
    private var nowDate = Date()
    
    private var dateFormatter = DateFormatter().then {
        $0.dateFormat = "yy.MM.dd"
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 175)
    }
    
    // MARK: - UI Property

    private lazy var dateLabel = UILabel().then {
        $0.text = self.dateFormatter.string(from: self.nowDate)
        $0.font = .subtitle2
        $0.textColor = .smemeBlack
        $0.setTextWithLineHeight(lineHeight: 19)
    }
    
    private lazy var beforeButton = UIButton().then {
        $0.setImage(Constant.Image.icnPageLeft, for: .normal)
        $0.addTarget(self, action: #selector(touchLeftButton(_:)), for: .touchUpInside)
    }
    
    private lazy var afterButton = UIButton().then {
        $0.setImage(Constant.Image.icnPageRight, for: .normal)
        $0.addTarget(self, action: #selector(touchRightButton(_:)), for: .touchUpInside)
    }
    
    // MARK: - @objc
    
    @objc func touchLeftButton(_ sender: UIButton) {
        print("touchBeforeButton")
    }
    
    @objc func touchRightButton(_ sender: UIButton) {
        print("touchAfterButton")
    }
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        backgroundColor = .white
    }
    
    private func setAttribute() {
        clipsToBounds = true
        layer.cornerRadius = 30
        layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
    }
    
    private func setLayout() {
        addSubviews( [dateLabel, beforeButton, afterButton] )
        
        dateLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(13)
        }
        
        beforeButton.snp.makeConstraints {
            $0.centerY.equalTo(self.dateLabel)
            $0.leading.equalToSuperview().inset(30)
            $0.height.equalTo(24)
            $0.width.equalTo(24)
        }
        
        afterButton.snp.makeConstraints {
            $0.centerY.equalTo(self.dateLabel)
            $0.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(24)
            $0.width.equalTo(24)
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBackgroundColor()
        setAttribute()
        setLayout()
        invalidateIntrinsicContentSize()

    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
