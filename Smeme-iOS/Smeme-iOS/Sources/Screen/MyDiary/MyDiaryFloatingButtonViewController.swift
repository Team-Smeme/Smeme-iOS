//
//  MyDiaryFloatingButtonViewController.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/07.
//

import UIKit

import SnapKit
import Then

final class MyDiaryFloatingButtonViewController: UIViewController {
    
    // MARK: - Property
    
    // MARK: - UI Property
    
    private lazy var koreanDiaryButton = IconWithTextButton().then {
        $0.configure(with: IconWithTextButtonViewModel(
            image: Constant.Image.icnKorean,
            text: "한국어 일기부터 쓰기"))
        $0.addShadow(shadowColor: .black, shadowOpacity: 0.12, shadowRadius: 20, offset: CGSize(width: 0, height: 0))
        $0.addTarget(self, action: #selector(koreanDiaryButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var foreignDiaryButton = IconWithTextButton().then {
        $0.configure(with: IconWithTextButtonViewModel(
            image: Constant.Image.icnForeign,
            text: "바로 외국어 일기 쓰기"))
        $0.addShadow(shadowColor: .black, shadowOpacity: 0.12, shadowRadius: 20, offset: CGSize(width: 0, height: 0))
        $0.addTarget(self, action: #selector(foreignDiaryButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var floatingButton = UIButton().then {
        $0.setImage(Constant.Image.btnX, for: .normal)
        $0.addTarget(self, action: #selector(floatingButtonClicked(_:)), for: .touchUpInside)
        $0.addShadow(shadowColor: .black, shadowOpacity: 0.08, shadowRadius: 20, offset: CGSize(width: 0, height: 0))
    }
    
    lazy var floatingDimView = UIView().then {
        $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setLayout()
    }
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        view.backgroundColor = .clear
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.dismiss(animated: true, completion: nil)
//    }
    
    private func setLayout() {
        view.addSubviews([floatingDimView, floatingButton, koreanDiaryButton, foreignDiaryButton])
        
        floatingDimView.snp.makeConstraints {
            $0.top.trailing.bottom.leading.equalToSuperview()
        }
        
        floatingButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(bottomHeightByNotch(102))
            $0.trailing.equalToSuperview().inset(18)
        }
        
        koreanDiaryButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(bottomHeightByNotch(174))
            $0.trailing.equalToSuperview().inset(24)
        }
        
        foreignDiaryButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(bottomHeightByNotch(224))
            $0.trailing.equalToSuperview().inset(24)
        }
    }
    
    // MARK: - @objc
    
    @objc func floatingButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func foreignDiaryButtonDidTap() {
        let diaryForeignViewController = DiaryForeignViewController()
        diaryForeignViewController.modalTransitionStyle = .coverVertical
        diaryForeignViewController.modalPresentationStyle = .fullScreen
        self.present(diaryForeignViewController, animated: true)
    }
    
    @objc func koreanDiaryButtonDidTap() {
        let stepOneKoreanDiaryViewController = StepOneKoreanDiaryViewController()
        let navigationController = UINavigationController(rootViewController: stepOneKoreanDiaryViewController)
        navigationController.modalTransitionStyle = .coverVertical
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = true
        present(navigationController, animated: true)
    }
}
