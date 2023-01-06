//
//  IconWithTextButton.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/07.
//

import UIKit

struct IconWithTextButtonViewModel {
    let image: UIImage?
    let text: String
}

final class IconWithTextButton: UIButton {
    
    // MARK: - Property
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 179, height: 44)
    }
    
    // MARK: - UI Property
    
    private var iconImageView = UIImageView()
    
    private let label = UILabel().then {
        $0.textColor = .smemeBlack
        $0.font = .body2
        $0.setTextWithLineHeight(lineHeight: 17)
    }
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        backgroundColor = .white
    }
    
    private func setAttribute() {
        layer.cornerRadius = 8
    }
    
    func configure(with viewModel: IconWithTextButtonViewModel) {
        label.text = viewModel.text
        iconImageView.image = viewModel.image
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubviews([iconImageView, label])
        
        iconImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(12)
        }
        
        label.snp.makeConstraints {
            $0.centerX.equalTo(iconImageView)
            $0.leading.equalTo(iconImageView).offset(6)
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBackgroundColor()
        setAttribute()
        invalidateIntrinsicContentSize()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
