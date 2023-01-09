//
//  SplashViewController.swift
//  Smeme-iOS
//
//  Created by JH on 2023/01/09.
//

import UIKit

import Lottie
import SnapKit

class SplashViewController: UIViewController {
    
    // MARK: - Property
    
    // MARK: - UI Property
    
    let animationView: LottieAnimationView = {
        let aniView = LottieAnimationView(name: "smemeSplash")
        aniView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        aniView.contentMode = .scaleAspectFit
        
        return aniView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setBackgroundColor()
        setAnimation()
                
        // MARK: - @objc
        
        // MARK: - Custom Method
        
        func setBackgroundColor() {
            view.backgroundColor = .white
        }
        
        func setLayout() {
            view.addSubview(animationView)
            
            animationView.snp.makeConstraints {
                $0.centerX.centerY.equalToSuperview()
                $0.height.equalTo(250)
            }
        }
        
        func setAnimation () {
            animationView.play { _ in
                self.animationView.loopMode = .loop
            }
        }
    }
}
