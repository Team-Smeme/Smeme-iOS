//
//  RandomSubjectView.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/04.
//

import UIKit

import SnapKit
import Then

struct RandomSubjectViewModel {
    var contentText: String
}

final class RandomSubjectView: UIView {
    
    // MARK: - Property
    
    var refreshSubjectContent: (() -> Void)?
    
    // MARK: - UI Property
    
    private let questionLabel = UILabel().then {
        $0.font = .body3
        $0.text = "Q."
        $0.textColor = .primary
    }
    
    private let contentLabel = UILabel().then {
        $0.textAlignment = .left
        $0.font = .body4
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
    }
    
    private let refreshButton = UIButton().then {
        $0.setImage(Constant.Image.icnRefresh, for: .normal)
    }
    
    // MARK: - @objc
    
    // MARK: - Custom Method
    
    private func setAttribute() {
        addSubviews([questionLabel, contentLabel, refreshButton])
        
        backgroundColor = .gray100
        clipsToBounds = true
    }
    
    func configure(with viewModel: RandomSubjectViewModel) {
        contentLabel.text = viewModel.contentText
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentLabel.sizeToFit()
        questionLabel.frame = CGRect(x: (UIScreen.main.bounds.width - 315) / 2,
                                     y: 16,
                                     width: 14,
                                     height: 17)
        contentLabel.frame = CGRect(x: (UIScreen.main.bounds.width - 315) / 2,
                                    y: 14,
                                    width: 315,
                                    height: 42)
        refreshButton.frame = CGRect(x: (UIScreen.main.bounds.width - 315) / 2 + 315 - 22,
                                     y: 14 + contentLabel.frame.size.height + 3,
                                     width: 22,
                                     height: 22)
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setAttribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
