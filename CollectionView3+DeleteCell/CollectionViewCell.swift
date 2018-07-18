//
//  CollectionViewCell.swift
//  CollectionView3+DeleteCell
//
//  Created by Đừng xóa on 7/14/18.
//  Copyright © 2018 Đừng xóa. All rights reserved.
//

import UIKit
protocol CollectionViewCellDelegate: class {
    func delete(at indexPath: IndexPath)
}

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var labelText: UILabel!
    var indexPath: IndexPath!
    
    weak var delegate: CollectionViewCellDelegate?
    
    @IBAction func deleteButton(_ sender: UIButton) {
        if indexPath != nil {
            delegate?.delete(at: indexPath)
        }
    }
}
