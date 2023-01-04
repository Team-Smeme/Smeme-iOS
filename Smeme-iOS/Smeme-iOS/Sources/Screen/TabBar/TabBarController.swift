//
//  TabBarController.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/04.
//

import UIKit

class TabBarController: UITabBarController {

    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
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
                                   renderingMode: .alwaysTemplate)
        let openDiary = makeTabBar(viewController: OpenDiaryViewController(),
                                       title: "",
                                       tabBarImg: Constant.Image.tabBarOpenDiary,
                                 tabBarSelectedImg: Constant.Image.tabBarOpenDiarySelected,
                                 renderingMode: .alwaysTemplate)
        let scrapStash = makeTabBar(viewController: ScrapStashViewController(),
                                     title: "",
                                     tabBarImg: Constant.Image.tabBarStash,
                                 tabBarSelectedImg: Constant.Image.tabBarStashSelected,
                                 renderingMode: .alwaysTemplate)
        
        let tabs = [myDiary, openDiary, scrapStash]
    
        self.setViewControllers(tabs, animated: false)
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .primary
    }
}
