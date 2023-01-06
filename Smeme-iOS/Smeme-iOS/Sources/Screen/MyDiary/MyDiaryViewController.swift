//
//  MyDiaryViewController.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/04.
//

import UIKit

final class MyDiaryViewController: UIViewController {
    
    // MARK: - Property
    
    // MARK: - UI Property
    
    private var withRefreshView = RandomSubjectView()
    private var noRefreshView = RandomSubjectView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setBackgroundColor()
        setAttribute()
        setLayout()
    }
    
    // MARK: - @objc
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews([withRefreshView, noRefreshView])
        
        withRefreshView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(163)
            $0.leading.equalTo(self.view.snp.leading)
        }
        
        noRefreshView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(400)
            $0.leading.equalTo(self.view.snp.leading)
        }
    }
    
    private func setAttribute() {
        withRefreshView = withRefreshView.then {
            $0.configure(with: RandomSubjectViewModel(contentText: "오늘부터 딱 일주일 후! 설레는 크리스마스네요. 일주일 전부터 세워보는 나의 크리스마스 계획은? 오늘부터 딱 일주일 후! 설레는 크리스마스네요. 일주일 전부터 세워보는 나의 크리스마스 계획은?", isHiddenRefreshButton: false))
            $0.refreshSubjectContent = {
                print("새로고침")
            }
        }
        
        noRefreshView = noRefreshView.then {
            $0.configure(with: RandomSubjectViewModel(contentText: "오늘부터 딱 일주일 후! 설레는 크리스마스네요. 일주일 전부터 세워보는 나의 크리스마스 계획은?", isHiddenRefreshButton: true))
            $0.refreshSubjectContent = {
                print("새로고침")
            }
        }
    }
}
