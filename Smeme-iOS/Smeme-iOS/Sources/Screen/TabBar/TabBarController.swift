//
//  TabBarController.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/04.
//

import UIKit

class TabBarController: UITabBarController {

private lazy var defaultTabBarHeight = { tabBar.frame.size.height }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        setTabBarShadow()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setTabBarHeight()
    }
}

extension TabBarController {
    private func makeTabBar(viewController: UIViewController,
                            title: String,
                            tabBarImg: UIImage,
                            tabBarSelectedImg: UIImage,
                            renderingMode: UIImage.RenderingMode) -> UIViewController {
        
        let tab = UINavigationController(rootViewController: viewController)
        tab.isNavigationBarHidden = true
        tab.tabBarItem = UITabBarItem(title: title,
                                      image: tabBarImg.withRenderingMode(renderingMode),
                                      selectedImage: tabBarSelectedImg.withRenderingMode(renderingMode))
        return tab
    }
    
    private func setTabBar() {
        let myDiary = makeTabBar(viewController: MyDiaryViewController(),
                                   title: "",
                                 tabBarImg: Constant.Image.tabBarMyDiary,
                                   tabBarSelectedImg: Constant.Image.tabBarMyDiarySelected,
                                   renderingMode: .alwaysOriginal)
        let openDiary = makeTabBar(viewController: OpenDiaryViewController(),
                                       title: "",
                                       tabBarImg: Constant.Image.tabBarOpenDiary,
                                 tabBarSelectedImg: Constant.Image.tabBarOpenDiarySelected,
                                 renderingMode: .alwaysOriginal)
        let scrapStash = makeTabBar(viewController: ScrapStashViewController(),
                                     title: "",
                                     tabBarImg: Constant.Image.tabBarStash,
                                 tabBarSelectedImg: Constant.Image.tabBarStashSelected,
                                 renderingMode: .alwaysOriginal)
        
        let tabs = [myDiary, openDiary, scrapStash]
    
        self.setViewControllers(tabs, animated: false)
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .primary
    }
    
    private func setTabBarHeight() {
        let newTabBarHeight = defaultTabBarHeight + convertByHeightRatio(34)

        var newFrame = tabBar.frame
        newFrame.size.height = newTabBarHeight
        newFrame.origin.y = view.frame.size.height - newTabBarHeight

        tabBar.frame = newFrame
    }

    private func setTabBarShadow() {
        UITabBar.clearShadow()
        tabBar.layer.applyShadow(color: .black, alpha: 0.15, x: 0, y: 3, blur: 14)
    }
}

// MARK: - SetShadow

extension CALayer {
    func applyShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4
    ) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
    }
}

extension UITabBar {
    static func clearShadow() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
    }
}
