//
//  CustomCollectionViewCell.swift
//  CollectionDemo
//
//  Created by tropsci on 15/7/29.
//  Copyright (c) 2015年 topsci. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var selectedMark: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellLabeLeft: NSLayoutConstraint!
    
    enum CellSelectType: Int {
        case CellTypeDefault = 0
        case CellTypeSelected
        case CellTypeSelectedDouble
    }
    
    var cellSelectType = CellSelectType.CellTypeDefault
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        layer.borderColor = UIColor.grayColor().CGColor
        layer.borderWidth = 0.2
        selectedMark.hidden = true
        cellLabel.textColor = UIColor.darkGrayColor()
        cellLabeLeft.constant = -3
    }
    
    func taggleSelectedType() {
        cellSelectType = CellSelectType(rawValue: (cellSelectType.rawValue + 1) % 3)!
//        println("\(cellSelectType.rawValue)")
        // 3B8CCA
        if cellSelectType == .CellTypeDefault {
            backgroundColor = UIColor.whiteColor()
            cellLabel.textColor = UIColor.darkGrayColor()
            selectedMark.hidden = true
            cellLabeLeft.constant = -3
        } else if cellSelectType == .CellTypeSelected {
            backgroundColor = UIColor(red: CGFloat(0x3B) / 255 , green: CGFloat(0x8C)  / 255, blue: CGFloat(0xCA) / 255, alpha: 1)
            cellLabel.textColor = UIColor.whiteColor()
            selectedMark.hidden = true;
            cellLabeLeft.constant = -3;
        } else {
            backgroundColor = UIColor(red: CGFloat(0x3B) / 255 , green: CGFloat(0x8C)  / 255, blue: CGFloat(0xCA) / 255, alpha: 1)
            cellLabel.textColor = UIColor.whiteColor()
            selectedMark.hidden = false
            cellLabeLeft.constant = -23
        }

    }
}
