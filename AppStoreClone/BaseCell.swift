//
//  BaseCell.swift
//  AppStoreClone
//
//  Created by Mac Gallagher on 7/25/18.
//  Copyright © 2018 Mac Gallagher. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    func setupViews() {}
}
