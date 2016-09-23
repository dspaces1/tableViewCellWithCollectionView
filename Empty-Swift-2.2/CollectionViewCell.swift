//
//  CollectionViewCell.swift
//  Empty-Swift-2.2
//
//  Created by Diego Urquiza on 9/23/16.
//  Copyright © 2016 Diego Urquiza. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    func setup(title: String) {
        self.title.text = title
        contentView.setNeedsLayout()
    }
}
