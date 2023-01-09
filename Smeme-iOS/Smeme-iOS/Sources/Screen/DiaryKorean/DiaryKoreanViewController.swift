//
//  DiaryKoreanViewController.swift
//  Smeme-iOS
//
//  Created by Joon Baek on 2023/01/09.
//

import UIKit

import SnapKit
import Then

final class DiaryKoreanViewController: UIViewController {
    // MARK: - Property
    // MARK: - UI Property
    
    private let naviView = UIView()
    private let languageView = UIView()
    
    private let cancelButton = UIButton().then {
        $0.titleLabel?.font = .body1
        $0.setTitleColor(.black, for: .normal)
        $0.setTitle("취소", for: .normal)
    }
    
    private let completeButton = UIButton().then {
        $0.titleLabel?.font = .body1
        $0.setTitleColor(.black, for: .normal)
        $0.setTitle("완료", for: .normal)
    }
    
    private let languageLabel = UILabel().then {
        $0.font = .subtitle2
        $0.textColor = .gray500
        $0.text = "English"
    }
    
    private let languageIcon = UIImageView(image: Constant.Image.icnArrowUnder)
    
    private let stepLabel = UILabel().then {
        $0.font = .caption1
        $0.textColor = .gray400
        $0.text = "STEP 1"
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgoundColor()
        setLayout()

    }
    
    // MARK: - @objc
    
    // MARK: - Custom Method
    private func setBackgoundColor() {
        view.backgroundColor = .smemeWhite
    }
}
