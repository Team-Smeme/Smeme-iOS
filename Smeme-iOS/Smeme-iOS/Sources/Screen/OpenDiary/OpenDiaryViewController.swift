//
//  OpenDiaryViewController.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/04.
//

import UIKit

import SnapKit
import Then

final class OpenDiaryViewController: UIViewController {
    
    // MARK: - Property
    
    // MARK: - UI Property
    
    private let headerView = UIView().then {
        $0.backgroundColor = .white
        $0.roundCorners(cornerRadius: 30, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
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
        view.backgroundColor = .background
    }
    
    private func setLayout() {
        view.addSubview(headerView)
        
        headerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(198)
        }
        
    }

}
