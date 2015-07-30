//
//  ViewController.swift
//  CollectionDemo
//
//  Created by tropsci on 15/7/29.
//  Copyright (c) 2015年 topsci. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    let dataList = [
        ["初一", "初二", "中考", "高一", "高二", "高考"],
        ["语文", "数学", "外语", "历史", "地理"],
        ["通用版", "苏教版", "人教A版", "人教B版", "湘教版", "北师大版"]
    ]
    let titleList = ["设置学段", "设置学科", "设置版本"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension ViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

    // MARK: UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return dataList.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList[section].count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // CollectionResueID
        let reuseID = "CollectionResueID"
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseID, forIndexPath: indexPath) as! CustomCollectionViewCell
        cell.cellLabel.text = dataList[indexPath.section][indexPath.row]
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader , withReuseIdentifier: "headerSectionView", forIndexPath: indexPath) as! CustomHeaderView
        headerView.sectionTitle?.text = titleList[indexPath.section]
        return headerView
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(80, 40)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(5, 5, 5, 5)
    }
    
    
    // MARK: UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! CustomCollectionViewCell
        cell.taggleSelectedType()
    }

}
