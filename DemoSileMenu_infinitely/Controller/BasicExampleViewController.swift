//
//  AppDelegate.swift
//  DemoSileMenu_infinitely
//
//  Created by Anh vũ on 6/1/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class BasicExampleViewController: UIViewController,FSPagerViewDataSource,FSPagerViewDelegate {
    fileprivate let imageNames = ["8","8","8"]
    fileprivate var numberOfItems = 3
 
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.pagerView.itemSize = FSPagerView.automaticSize
           
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       self.pagerView.automaticSlidingInterval = 3.0 - self.pagerView.automaticSlidingInterval
        
    }

    @IBOutlet weak var pageControl: FSPageControl! {
        didSet {
            self.pageControl.numberOfPages = self.imageNames.count
            self.pageControl.contentHorizontalAlignment = .right
            self.pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
    // MARK:- FSPagerView DataSource
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.numberOfItems
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: self.imageNames[index])
//        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
//        cell.textLabel?.text = index.description+index.description
        return cell
    }
    
    // MARK:- FSPagerView Delegate
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.pageControl.currentPage = pagerView.currentIndex
    }
    
}


