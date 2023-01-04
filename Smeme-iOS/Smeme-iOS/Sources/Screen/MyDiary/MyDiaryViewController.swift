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
    
    var tmpView = RandomSubjectView(frame: CGRect(x: 0, y: 120, width: UIScreen.main.bounds.width, height: 91))
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setAttribute()
    }
    
    // MARK: - @objc
    
    // MARK: - Custom Method
    func setAttribute() {
        view.addSubviews([tmpView])
        view.backgroundColor = .white
        
        tmpView = tmpView.then {
            $0.configure(with: RandomSubjectViewModel(contentText: "     " + "오늘부터 딱 일주일 후! 설레는 크리스마스네요. 일주일 전부터 세워보는 나의 크리스마스 계획은?"))
        }
    }
}
