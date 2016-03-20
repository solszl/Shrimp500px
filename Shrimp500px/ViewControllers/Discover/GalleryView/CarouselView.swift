//
//  CarouselView.swift
//
//  Created by 振亮 孙 on 16/3/11.
//  Copyright © 2016年 papa.studio. All rights reserved.
//
import UIKit
import SnapKit

let TimeInterval = 2.5          //全局的时间间隔

class CarouselView: UIView, UIScrollViewDelegate {
    /*********************************** Property ****************************************/
     //MARK:- Property
    
    var contentScrollView: UIScrollView!
    
    var imageArray: [UIImage!]! {
        //监听图片数组的变化，如果有变化立即刷新轮转图中显示的图片
        willSet(newValue) {
            self.imageArray = newValue
        }
        /**
        *  如果数据源改变，则需要改变scrollView、分页指示器的数量
        */
        didSet {
            contentScrollView.scrollEnabled = !(imageArray.count == 1)
            self.setScrollViewOfImage()
        }
    }
    
    var delegate: CirCleViewDelegate?
    
    var indexOfCurrentImage: Int!
    
    var timer:              NSTimer?                //计时器
    
    
    var lastItem: CarouselItemRender!
    var middleItem: CarouselItemRender!
    var nextItem: CarouselItemRender!
    
    var data: [Gallery]!
    
    var currentIndex: Int = 0
    
    /*********************************** Begin ****************************************/
    //MARK:- Begin
    override init(frame: CGRect) {
        super.init(frame: frame)
        data = []
        // 默认显示第一张图片
        self.indexOfCurrentImage = 0
        self.setUpCircleView()
    }
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /********************************** Privite Methods ***************************************/
     //MARK:- Privite Methods
    private func setUpCircleView() {
        self.contentScrollView = UIScrollView()
        contentScrollView.contentSize = CGSizeMake(self.frame.size.width * 3, 200)
        contentScrollView.delegate = self
        contentScrollView.bounces = false
        contentScrollView.pagingEnabled = true
        contentScrollView.backgroundColor = UIColor.greenColor()
        contentScrollView.showsHorizontalScrollIndicator = false
        contentScrollView.scrollEnabled = !(data.count == 1)
        self.addSubview(contentScrollView)
        
        self.contentScrollView.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: ScreenWidth, height: 200))
            make.leading.top.equalTo(0)
        }

        
        //设置计时器
        self.timer = NSTimer.scheduledTimerWithTimeInterval(TimeInterval, target: self, selector: "timerAction", userInfo: nil, repeats: true)
        
        self.middleItem = CarouselItemRender()
        self.middleItem.userInteractionEnabled = true
        self.middleItem.frame = CGRectMake(self.frame.size.width, 0, self.frame.size.width, 200)
        self.contentScrollView.addSubview(middleItem)
        
        self.lastItem = CarouselItemRender()
        self.lastItem.userInteractionEnabled = true
        self.lastItem.frame = CGRectMake(0, 0, self.frame.size.width, 200)
        self.contentScrollView.addSubview(lastItem)
        
        self.nextItem = CarouselItemRender()
        self.nextItem.userInteractionEnabled = true
        self.nextItem.frame = CGRectMake(self.frame.size.width * 2, 0, self.frame.size.width, 200)
        self.contentScrollView.addSubview(nextItem)
        
        //添加点击事件
//        let imageTap = UITapGestureRecognizer(target: self, action: Selector("imageTapAction:"))
//        middleItem.addGestureRecognizer(imageTap)
        
        self.setScrollViewOfImage()
        contentScrollView.setContentOffset(CGPointMake(self.frame.size.width, 0), animated: false)
    }
    
    //MARK: 设置图片
    private func setScrollViewOfImage(){      
        guard data.count != 0 else {
            //
            print("data is null")
            return
        }
        
        self.middleItem.setData(data[self.currentIndex])
        self.nextItem.setData(data[nextIndex()])
        self.lastItem.setData(data[previousIndex()])
        
    }
    
    private func nextIndex() -> Int {
        
        let tempIndex = self.currentIndex + 1
        guard tempIndex < self.data.count else {

            return 0//self.data.count - 1
        }
        return tempIndex
    }
    
    private func previousIndex() -> Int {
        
        let tempIndex = self.currentIndex - 1
        guard tempIndex >= 0 else {
            return self.data.count - 1 //0
        }
        return tempIndex
    }
    
    //事件触发方法
    func timerAction() {
        print("timer", terminator: "")
        contentScrollView.setContentOffset(CGPointMake(self.frame.size.width*2, 0), animated: true)
    }
    
    
    /********************************** Public Methods  ***************************************/
     //MARK:- Public Methods
    func imageTapAction(tap: UITapGestureRecognizer){
        self.delegate?.clickCurrentImage!(indexOfCurrentImage)
    }
    
    
    /********************************** Delegate Methods ***************************************/
     //MARK:- Delegate Methods
     //MARK: UIScrollViewDelegate
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        timer?.invalidate()
        timer = nil
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        //如果用户手动拖动到了一个整数页的位置就不会发生滑动了 所以需要判断手动调用滑动停止滑动方法
        if !decelerate {
            self.scrollViewDidEndDecelerating(scrollView)
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let offset = scrollView.contentOffset.x
        if offset == 0 {
            self.currentIndex = self.previousIndex()
        }else if offset == self.frame.size.width * 2 {
            
            self.currentIndex = self.nextIndex()
        }
        // 重新布局图片
        self.setScrollViewOfImage()
        //布局后把contentOffset设为中间
        scrollView.setContentOffset(CGPointMake(self.frame.size.width, 0), animated: false)
        
        //重置计时器
        if timer == nil {
            self.timer = NSTimer.scheduledTimerWithTimeInterval(TimeInterval, target: self, selector: "timerAction", userInfo: nil, repeats: true)
        }
    }
    
    //时间触发器 设置滑动时动画true，会触发的方法
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        print("animator", terminator: "")
        self.scrollViewDidEndDecelerating(contentScrollView)
    }
    
}

/********************************** Protocol Methods ***************************************/
 //MARK:- Protocol Methods


@objc protocol CirCleViewDelegate {
    /**
     *  点击图片的代理方法
     *
     *  @para  currentIndxe 当前点击图片的下标
     */
    optional func clickCurrentImage(currentIndxe: Int)
}


//extension CarouselView: UIScrollViewDelegate {
//    
//}