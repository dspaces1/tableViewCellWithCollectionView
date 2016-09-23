//
//  TableViewCell.swift
//  Empty-Swift-2.2
//
//  Created by Diego Urquiza on 9/23/16.
//  Copyright © 2016 Diego Urquiza. All rights reserved.
//

import UIKit


let selection = ["breakfast, lunch, dinner, snack"]

class DynamicCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if bounds.size != intrinsicContentSize() {
            invalidateIntrinsicContentSize()
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        return self.contentSize
    }
}

class TableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: DynamicCollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.scrollEnabled = false
        
        collectionView.dataSource = self
        
        let contentSize = collectionView.collectionViewLayout.collectionViewContentSize()
        print(contentSize)
        
        let flow = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.estimatedItemSize = CGSizeMake(1, 1)
    }
    
        override func systemLayoutSizeFittingSize(targetSize: CGSize) -> CGSize {
            collectionView.frame = CGRect(x: 0, y: 0, width: targetSize.width, height: 400.0)
            collectionView.layoutIfNeeded()
            return collectionView.collectionViewLayout.collectionViewContentSize()
        }
}

extension TableViewCell: UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SquareID", forIndexPath: indexPath) as! CollectionViewCell
        cell.setup(selection[indexPath.row])
        return cell
    }
}
