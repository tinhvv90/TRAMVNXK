//
//  SelectedAdressViewController.swift
//  TRAMVNXK
//
//  Created by Tinh on 5/13/16.
//  Copyright © 2016 Tinh. All rights reserved.
//

import UIKit

class SelectedAdressViewController: AnimationViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildNavigationItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
//    MARK: - Buide UI
    private func buildNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem.barButton("Back", titleColor: UIColor.blackColor(), image: UIImage(named: "icon_black_scancode")!, hightLightImage: nil, target: self, action: "leftItemClick", type: ItemButtonType.Left)
        navigationItem.rightBarButtonItem = UIBarButtonItem.barButton("SEARCH", titleColor: UIColor.blackColor(), image: UIImage(named: "icon_search")!, hightLightImage: nil, target: self, action: "rightItemClick", type: ItemButtonType.Right)
        
    }
    
    // MARK:- Action
    // MARK: sweep the search Action
//    func leftItemClick() {
//        let qrCode = QRCodeViewController()
//        navigationController?.pushViewController(qrCode, animated: true)
//    }
    
//    func rightItemClick() {
//        let searchVC = SearchProductViewController()
//        navigationController!.pushViewController(searchVC, animated: false)
//    }
}
