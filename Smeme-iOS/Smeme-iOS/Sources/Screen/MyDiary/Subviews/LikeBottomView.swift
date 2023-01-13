//
//  likeBottomView.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/09.
//

import UIKit

import SnapKit
import Then

struct LikeBottomViewModel {
    let likeCount: Int
}

final class LikeBottomView: UIView {
    
    // MARK: - Property
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: convertByHeightRatio(64))
    }
    
    // MARK: - UI Property
    
    private let likeImageView = UIImageView().then {
        $0.image = Constant.Image.icnLikeSelected
    }
    
    private let likeLabel = UILabel().then {
        $0.textColor = .primary
        $0.font = .body2
    }
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        backgroundColor = .white
    }
    
    func configure(with viewModel: LikeBottomViewModel) {
        likeLabel.text = "\(viewModel.likeCount)개의 추천"
    }
    
    private func setLayout() {
        addSubviews([likeImageView, likeLabel])
        
        likeImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(convertByWidthRatio(30))
            $0.height.width.equalTo(convertByWidthRatio(18))
        }
        
        likeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(likeImageView.snp.trailing).offset(convertByWidthRatio(4))
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBackgroundColor()
        setLayout()
        invalidateIntrinsicContentSize()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
