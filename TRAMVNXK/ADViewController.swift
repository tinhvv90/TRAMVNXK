//
//  ADViewController.swift
//  TRAMVNXK
//
//  Created by Tinh on 5/13/16.
//  Copyright © 2016 Tinh. All rights reserved.
//

import UIKit

class ADViewController: UIViewController {
    
    private lazy var backImageView: UIImageView = {
       let backImageView = UIImageView()
        backImageView.frame = ScreenBounds
        return backImageView
    }()
    
    var imageName : String? {
        didSet {
            var placeholderImageName : String?
            switch UIDevice.currentDeviceScreenMeasurement() {
            case 3.5:
                placeholderImageName = "iphone4"
            case 4.0:
                placeholderImageName = "iphone5"
            case 4.7:
                placeholderImageName = "iphone6"
            default:
                placeholderImageName = "iphone6s"
            }
            
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backImageView)
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.None)
    }
}
