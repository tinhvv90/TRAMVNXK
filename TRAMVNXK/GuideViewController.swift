//
//  GuideViewController.swift
//  TRAMVNXK
//
//  Created by Tinh on 5/13/16.
//  Copyright © 2016 Tinh. All rights reserved.
//

import UIKit

class GuideViewController: BaseViewController {
    
    private var collectionView : UICollectionView?
    private var imageNames = ["guide_1","guide_2","guide_3","guide_4"]
    private var cellGuide = "GuideCell"
    private var isHiddenNextButton = true
    private var pageController = UIPageControl(frame: CGRectMake(0,ScreenHeight - 50 , ScreenWidth,20))

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: UIStatusBarAnimation.None)
        buildCollectionView()
        
    }
    
//    MARK: - Buide UI
    private func buildCollectionView() {
        setupLayoutCollectionView()
        setupCollectionView()
    }
    
    func setupLayoutCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = ScreenBounds.size
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        
        collectionView = UICollectionView(frame: ScreenBounds, collectionViewLayout: layout)
    }
    
    func setupCollectionView() {
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.pagingEnabled = true
        collectionView?.bounces = false
        collectionView?.registerClass(GuideCell.self, forCellWithReuseIdentifier: cellGuide)
        view.addSubview(collectionView!)
    }
    
    private func buidePageController() {
        pageController.numberOfPages = imageNames.count
        pageController.currentPage = 0
        view.addSubview(pageController)
    }
    
    
    
}

extension GuideViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellGuide, forIndexPath: indexPath) as! GuideCell
        cell.newImage = UIImage(named: imageNames[indexPath.row])
        if indexPath.row != imageNames.count - 1 {
            cell.setNextButtonHidden(true)
        }
        return cell
    }
    
    
}
