//
//  MainTabBarController.swift
//  TRAMVNXK
//
//  Created by Tinh on 5/13/16.
//  Copyright © 2016 Tinh. All rights reserved.
//

import UIKit

class MainTabBarController: AnimationTabBarController, UITabBarControllerDelegate {
    
    private var fristLoadMainTabBarController: Bool = true
    private var adImageView: UIImageView?
    var adImage: UIImage? {
        didSet {
            weak var tmpSelf = self
            adImageView = UIImageView(frame: ScreenBounds)
            adImageView!.image = adImage!
            self.view.addSubview(adImageView!)
            
            UIImageView.animateWithDuration(2.0, animations: { () -> Void in
                tmpSelf!.adImageView!.transform = CGAffineTransformMakeScale(1.2, 1.2)
                tmpSelf!.adImageView!.alpha = 0
                }) { (finsch) -> Void in
                    tmpSelf!.adImageView!.removeFromSuperview()
                    tmpSelf!.adImageView = nil
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        buildMainTabBarChildViewController()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if fristLoadMainTabBarController {
            let containers = createViewContainers()
            createCustomIcons(containers)
            fristLoadMainTabBarController = false
        }
    }
    
    
//    MARK: - Method 
    // MARK: - Tabbar
    private func buildMainTabBarChildViewController() {
        tabBarControllerAddChildViewController(HomeViewController(), title: "Home", imageName: "v2_home", selectedImageName: "v2_home_r", tag: 0)
        tabBarControllerAddChildViewController(SupermarketViewController(), title: "TramVnxk", imageName: "v2_order", selectedImageName: "v2_order_r", tag: 1)
        tabBarControllerAddChildViewController(ShopCartViewController(), title: "ShoppingCart", imageName: "shopCart", selectedImageName: "shopCart", tag: 2)
        tabBarControllerAddChildViewController(MineViewController(), title: "Mine", imageName: "v2_my", selectedImageName: "v2_my_r", tag: 3)
    }
    
    private func tabBarControllerAddChildViewController(childView: UIViewController, title: String, imageName: String, selectedImageName: String, tag: Int ) {
        let vcItem = RAMAnimatedTabBarItem(title: title, image: UIImage(named: imageName), selectedImage: UIImage(named: selectedImageName))
        
        vcItem.tag = tag
        vcItem.animation = RAMBounceAnimation()
        childView.tabBarItem = vcItem
        
        let navigationVC = BaseNavigationController(rootViewController: childView)
        addChildViewController(navigationVC)
    }
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        let childArr = tabBarController.childViewControllers as NSArray
        let index = childArr.indexOfObject(viewController)
        
        if index == 2 {
            return false
        }
        
        return true
    }
    
}
