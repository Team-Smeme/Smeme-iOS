//
//  ClearButtonTextField.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/09.
//

import UIKit

struct ClearButtonTextFieldViewModel {
    let placeHolderText: String
}

final class ClearButtonTextField: UIView {
    
    // MARK: - Property
    
    var clearText: (() -> Void)?
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: convertByWidthRatio(315), height: convertByHeightRatio(52))
    }
    
    // MARK: - UI Property
    
    private var textField = UITextField()
   
    private lazy var clearButton = UIButton().then {
        $0.setImage(Constant.Image.icnCircleX, for: .normal)
        $0.addTarget(self, action: #selector(clearButtonDidTap(_:)), for: .touchUpInside)
    }
    
    // MARK: - @objc
    
    @objc func clearButtonDidTap(_ sender: UIButton) {
        print("clear")
    }
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        backgroundColor = .gray100
    }
    
    func configure(with viewModel: ClearButtonTextFieldViewModel) {
        textField.placeholder = viewModel.placeHolderText
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubviews([textField, clearButton])
        
        textField.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(14)
            $0.width.equalTo(convertByWidthRatio(261))
        }
        
        clearButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(convertByWidthRatio(15))
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBackgroundColor()
        makeRoundCorner(cornerRadius: 9)
        invalidateIntrinsicContentSize()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
