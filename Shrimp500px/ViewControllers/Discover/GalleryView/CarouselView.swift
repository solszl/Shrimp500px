//
//  CarouselView.swift
//
//  Created by 振亮 孙 on 16/3/11.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit
@objc protocol CarouselDataSource: NSObjectProtocol {
    func numOfViews() -> Int
    func carouselView(carouselView: CarouselView, viewIndex: Int) -> UIView
}
@objc protocol CarouselDelegate: NSObjectProtocol {
    optional func carouselView(carouselView: CarouselView, touched index: Int)
}
class CarouselView: UIView,UIScrollViewDelegate {
    var sleepTime: NSTimeInterval = 5
    var run: Bool! = false {
        didSet{
            if oldValue == false && self.run == true {
//                self.runView()
                Consuming.carousel(self, status: { () -> Bool in
                    return self.run
                })
            }
        }
    }
    
    var viewDataSource: CarouselDataSource?
    var viewDelegate: CarouselDelegate?
    var views: [UIView]! {
        didSet {
            self.putUpViews()
        }
    }
    
    private var scrollView: UIScrollView!
    private var pager: UIPageControl!
    
    func addChildView(view: UIView) {
        let tap = UITapGestureRecognizer(target: self, action: Selector("touchedView:"))
        view.addGestureRecognizer(tap)
        view.userInteractionEnabled = true
        self.views.append(view)
    }
    
    private func putUpViews() {
        self.pager.numberOfPages = 0
        for v in self.scrollView.subviews {
            if v.isKindOfClass(UIPageControl) {
                return
            }
            v.removeFromSuperview()
        }
        for view in self.views {
            view.frame = CGRectMake(CGFloat(self.pager.numberOfPages)*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)
            self.scrollView.addSubview(view)
            self.scrollView.contentSize = CGSizeMake(CGFloat(self.pager.numberOfPages+1)*self.frame.size.width, 0)
            view.backgroundColor = UIColor.randomColor()
//            view.snp_makeConstraints(closure: { (make) -> Void in
//                make.size.equalTo(CGSize(width: CGFloat(self.pager.numberOfPages+1) * ScreenWidth, height: 200))
//                make.center.equalTo(scrollView)
//            })
            self.pager.numberOfPages++
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.views = [UIView]()
        
        self.scrollView = UIScrollView(frame: frame)
        self.scrollView.pagingEnabled = true
        self.scrollView.delegate = self
        self.addSubview(self.scrollView)
        
        self.pager = UIPageControl()
        self.pager.numberOfPages = 0
        self.pager.currentPage = 0
        self.pager.center = CGPointMake(frame.size.width/2, frame.size.height - 16)
        self.pager.currentPageIndicatorTintColor = UIColor.orangeColor()
        self.addSubview(self.pager)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func nextPage() {
        if self.pager.numberOfPages <= 0 {
            return
        }
        var page = self.pager.currentPage
        if page == self.pager.numberOfPages-1 {
            page = 0
        }else {
            page++
        }
        self.scrollView.setContentOffset(CGPointMake(CGFloat(page)*self.frame.size.width, 0), animated: true)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.pager.currentPage = Int((scrollView.contentOffset.x + self.frame.size.width/2) / self.frame.size.width)
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.numByProtocol()
    }
    
    private func numByProtocol() {
        self.views.removeAll()
        if self.viewDataSource?.numOfViews() > 0 {
            self.dataByProtocol((self.viewDataSource?.numOfViews())!)
        }
    }
    
    private func dataByProtocol(num: Int) {
        for var i = 0; i < num; i++ {
            let view: UIView! = self.viewDataSource?.carouselView(self, viewIndex: i)
            let tap = UITapGestureRecognizer(target: self, action: Selector("touchedView:"))
            view.addGestureRecognizer(tap)
            view.userInteractionEnabled = true
            self.views.append(view)
        }
    }
    
    func touchedView(sender: UITapGestureRecognizer) {
        self.viewDelegate?.carouselView?(self, touched: self.pager.currentPage)
    }
    
    func reloadViews() {
        self.numByProtocol()
    }
}
