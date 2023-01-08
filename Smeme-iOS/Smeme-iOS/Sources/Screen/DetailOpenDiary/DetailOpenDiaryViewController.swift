//
//  DetailOpenDiaryViewController.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/08.
//

import UIKit

import SnapKit
import Then

final class DetailOpenDiaryViewController: UIViewController {
    
    // MARK: - Property
    
    // MARK: - UI Property
    
    private let headerView = UIView()
    
    private let backButton = UIButton().then {
        $0.setImage(Constant.Image.icnPageLeft, for: .normal)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setLayout()
    }
    
    // MARK: - @objc
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews([headerView])
        headerView.addSubview(backButton)
        
        headerView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(66)
        }
        
        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(28)
        }
    }

}
