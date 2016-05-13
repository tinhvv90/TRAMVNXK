//
//  PageScrollView.swift
//  TRAMVNXK
//
//  Created by Tinh on 5/13/16.
//  Copyright © 2016 Tinh. All rights reserved.
//

import UIKit

class PageScrollView: UIView {
    private let imageViewMaxCount = 3
    private var imageScrollView: UIScrollView!
    private var pageControl: UIPageControl!
    private var timer : NSTimer?
    private var placeholderImage: UIImage?
    private var imageClick: ((index: Int) -> ())?
    
   
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildImageScrollView()
        buildPageControl()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageScrollView.frame = bounds
        imageScrollView.contentSize = CGSizeMake(CGFloat(imageViewMaxCount) * width, 0)
        for i in 0...imageViewMaxCount - 1 {
            let imageView = imageScrollView.subviews[i] as! UIImageView
            imageView.userInteractionEnabled = true
            imageView.frame = CGRectMake(CGFloat(i) * imageScrollView.width, 0, imageScrollView.width, imageScrollView.height)
        }
        let pageW: CGFloat = 80
        let pageH: CGFloat = 20
        let pageX: CGFloat = imageScrollView.width - pageW
        let pageY: CGFloat = imageScrollView.height - pageH
        pageControl.frame = CGRectMake(pageX, pageY, pageW, pageH)
        
        updatePageScrollView()
        
    }
//    MARK: - Buide UI
    private func buildImageScrollView() {
        imageScrollView = UIScrollView()
        imageScrollView.bounces = true
        imageScrollView.showsHorizontalScrollIndicator = false
        imageScrollView.showsVerticalScrollIndicator = false
        imageScrollView.pagingEnabled = true
        imageScrollView.delegate = self
        addSubview(imageScrollView)
        for _ in 0..<3 {
            let imageView = UIImageView()
            let tap = UITapGestureRecognizer(target: self, action: "imageViewClick")
            imageView.addGestureRecognizer(tap)
            imageScrollView.addSubview(imageView)
        }
    }
    
    private func buildPageControl() {
        pageControl = UIPageControl()
        pageControl.hidesForSinglePage = true
        pageControl.pageIndicatorTintColor = UIColor(patternImage: UIImage(named: "v2_home_cycle_dot_normal")!)
        pageControl.currentPageIndicatorTintColor = UIColor(patternImage: UIImage(named: "v2_home_cycle_dot_selected")!)
        addSubview(pageControl)
    }
    
//    MARK: - Update contents
    private func updatePageScrollView() {
        
    }
    
//    MARK: Action
    func imageViewClick(tap: UITapGestureRecognizer) {
        if imageClick != nil {
            imageClick!(index: tap.view!.tag)
        }
    }
    
}


extension PageScrollView: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
    }
}
