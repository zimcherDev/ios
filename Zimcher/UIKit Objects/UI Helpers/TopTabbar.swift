//
//  TopTabbar.swift
//  Zimcher
//
//  Created by Tianhang Yang on 1/15/16.
//  Copyright © 2016 Zimcher. All rights reserved.
//

import UIKit

protocol TopTabbarDatasource {
    func numberOfItems() -> Int
    func topTabbar(topTabbar:TopTabbar, titleForItemAtIndex index:Int) -> String?
}
@objc protocol TopTabbarDelegate {
    optional func topTabbar(topTabbar:TopTabbar, didSelectItemAtIndex index:Int)
}

class TopTabbar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    
    let CELL_ID = "cell"
    let ITEM_HEIGHT:CGFloat = 34.0
    let BOTTOM_LINE_HEIGHT:CGFloat = 2.0
    
    private var numberOfItems:Int = 3
    
    var selectIndex:Int = 0
    var datasource:TopTabbarDatasource?
    var delegate:TopTabbarDelegate?
    
    
    private var collectionView:UICollectionView?
    private var bottomLine:UIView?
    private var heightConstraint:NSLayoutConstraint?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpSelf()
        self.setUpConstraints()

    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUpSelf()
        self.setUpConstraints()
    }
    
    
    private func setUpSelf() {
        self.backgroundColor = UIColor.whiteColor()
        
        //collectionview
        if (self.collectionView) != nil {
            self.collectionView!.removeFromSuperview()
        }
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        let collectionViewTemp = UICollectionView.init(frame: CGRectZero, collectionViewLayout: flowLayout)
        self.collectionView = collectionViewTemp
        self.collectionView!.backgroundColor! = UIColor.clearColor()
        self.collectionView!.showsHorizontalScrollIndicator = false
        self.collectionView!.showsVerticalScrollIndicator = false
        self.addSubview(self.collectionView!)
        self.collectionView!.registerClass(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: CELL_ID)
        self.collectionView!.dataSource = self;
        self.collectionView!.delegate = self;
        //bottomline
        if (self.bottomLine) != nil {
            self.bottomLine!.removeFromSuperview()
        }
        let viewTemp = UIView.init(frame: CGRectMake(0, ITEM_HEIGHT-BOTTOM_LINE_HEIGHT, UIScreen.mainScreen().bounds.size.width/CGFloat(numberOfItems), CGFloat(BOTTOM_LINE_HEIGHT)))
        self.bottomLine = viewTemp
        
        self.bottomLine!.backgroundColor = PALETTE.CORN_FLOWER_BLUE
        self.addSubview(self.bottomLine!)
    }
    
    private func setUpConstraints() {
        self.collectionView!.translatesAutoresizingMaskIntoConstraints = false;
        NSLayoutConstraint.pinSubView(self.collectionView!, superView: self)
        self.heightConstraint = NSLayoutConstraint.init(item: self, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant:CGFloat(ITEM_HEIGHT))
        
    }
    
    
    //MARK: collectionview
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (self.datasource) != nil {
            numberOfItems = self.datasource!.numberOfItems()
        }
        return numberOfItems
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CELL_ID, forIndexPath: indexPath)
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        var title = ""
        if (self.datasource) != nil {
            title = self.datasource!.topTabbar(self, titleForItemAtIndex:indexPath.row)!
        }
        let label = UILabel.init(frame: CGRectZero)
        label.text = title
        label.textAlignment = NSTextAlignment.Center
        label.textColor = PALETTE.WARM_GRAY
        label.sizeToFit()
        cell.contentView.addSubview(label)
        label.center = cell.contentView.center
        return cell
    }
    
    //MARK: layout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(UIScreen.mainScreen().bounds.size.width/CGFloat(numberOfItems), ITEM_HEIGHT)
    }
    
    //MARK: delegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        self.updateCell(cell!, changeState:true)
        let x = cell!.frame.origin.x - collectionView.contentOffset.x
        self.moveUnderLineToX(x)
        if self.delegate != nil {
            self.delegate!.topTabbar!(self, didSelectItemAtIndex: indexPath.row)
        }
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        self.updateCell(cell!, changeState: false)
    }
    
    
    //MARK: updateViews
    private func updateCell (cell:UICollectionViewCell, changeState state:Bool) {
        for item in cell.contentView.subviews {
            if let label = item as? UILabel {
                label.textColor = self.labelColor(state)
            }
        }
    }
    
    private func labelColor (state:Bool) -> UIColor {
        if (state) {
            return PALETTE.CORN_FLOWER_BLUE
        }
        else {
            return PALETTE.WARM_GRAY
        }
    }
    
    private func moveUnderLineToX (x:CGFloat) {
        UIView.animateWithDuration(0.2) { () -> Void in
            self.bottomLine!.frame = CGRectMake(x, self.bottomLine!.frame.origin.y, self.bottomLine!.frame.width, self.BOTTOM_LINE_HEIGHT)
        }
    }
    
    func pinHeight() {
        self.heightConstraint!.active = true
    }
}












