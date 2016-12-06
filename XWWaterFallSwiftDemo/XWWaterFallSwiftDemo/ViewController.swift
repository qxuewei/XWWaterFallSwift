//
//  ViewController.swift
//  XWWaterFallSwiftDemo
//
//  Created by 邱学伟 on 2016/12/5.
//  Copyright © 2016年 邱学伟. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    fileprivate let kCollectionCellID : String = "kCollectionCellID"
    
    fileprivate lazy var collectionView : UICollectionView = {
        
        //通过自定义layout改变collectionView的布局
        let layout : XWWaterFallLayout = XWWaterFallLayout()
        let itemMargin : CGFloat = 10
        layout.minimumLineSpacing = itemMargin
        layout.minimumInteritemSpacing = itemMargin
        layout.sectionInset = UIEdgeInsets(top: itemMargin, left: itemMargin, bottom: itemMargin, right: itemMargin)
        layout.dataSource = self
        
        let collectionView : UICollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        return collectionView;
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kCollectionCellID)
    }
}


extension ViewController : UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: kCollectionCellID, for: indexPath)
        cell.backgroundColor = UIColor.getRandomColor()
        return cell
    }
}

//MARK: - XWWaterFallLayoutDataSource数据源方法
extension ViewController : XWWaterFallLayoutDataSource {
    func numberOfCols(_waterFallLayout: XWWaterFallLayout) -> Int {
        return 4
    }
    func itemHeight(_waterFallLayout: XWWaterFallLayout, item: Int) -> CGFloat {
        return CGFloat(arc4random_uniform(200) + 100)
    }
}
