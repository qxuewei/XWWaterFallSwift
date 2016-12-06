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
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let cols : CGFloat = 3
        let itemMargin : CGFloat = 10
        let itemWH : CGFloat = (self.view.bounds.width - (cols + 1) * itemMargin) / cols
        layout.itemSize = CGSize(width: itemWH, height: itemWH)
        layout.minimumLineSpacing = itemMargin
        layout.minimumInteritemSpacing = itemMargin
        layout.sectionInset = UIEdgeInsets(top: itemMargin, left: itemMargin, bottom: itemMargin, right: itemMargin)
        
        let collectionView : UICollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        return collectionView;
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
//        let layout : UICollectionViewLayout = UICollectionViewFlowLayout()
        view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kCollectionCellID)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController : UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 70
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: kCollectionCellID, for: indexPath)
        cell.backgroundColor = UIColor.blue
        return cell
    }
}
