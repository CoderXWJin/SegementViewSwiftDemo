//
//  ViewController.swift
//  SegementViewSwiftDemo
//  Created by Justin on 2018/12/7.
//  Copyright © 2018年 Justin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var selectIndex: Int = 0
    fileprivate var currentIndex: Int = -1
    fileprivate var titles: [String]?
    fileprivate var arrVC:[UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SegementViewSwiftDemo"
        titles = ["分类", "推荐", "全部", "LOL", "刺激战场", "绝地求生", "王者荣耀","DNF"]
        segmentViewUI()
    }

    func segmentViewUI() {
        //创建控制器
        for index in 0..<(titles?.count)! {
            let randomColor = UIColor(red: CGFloat(arc4random()%255) / 255, green: CGFloat(arc4random()%255) / 255, blue: CGFloat(arc4random()%255) / 255, alpha: 1.0)
            let targetVC = TestViewController(text: (titles?[index])!, color: randomColor)
            arrVC.append(targetVC)
        }
        
        let segmentView = WHSegmentView(frame: CGRect.zero, arrTitle: titles!, viewControllers: arrVC, parentVc: self, isShowFilterButton: true)
        self.view.addSubview(segmentView)
        segmentView.snp.makeConstraints { (make) in
            make.right.left.equalTo(self.view)
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
            make.bottom.equalTo(self.view)
        }
        segmentView.selectIndex(index: selectIndex, changeIndexCallback: { (value) in
            if let index = value as? Int {
                if self.currentIndex == index { return }
                self.currentIndex = index
                print("当前选择的角标:%d", index)
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @objc fileprivate func filterButtonAction(_ sender: UIButton) {
        print("点击右边的过滤按钮")
    }
    
}

