//
//  CollectionViewController.swift
//  CollectionView3+DeleteCell
//
//  Created by Đừng xóa on 7/14/18.
//  Copyright © 2018 Đừng xóa. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController, CollectionViewCellDelegate {
    var numbers = [Int](1...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.setUp(with: 3, scrollDirection: .vertical, padding: 8)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return numbers.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        cell.labelText.text = "\(numbers[indexPath.row])"
        cell.indexPath = indexPath
        cell.delegate = self
        return cell
    }
    
    func delete(at indexPath: IndexPath) {
        numbers.remove(at: indexPath.row)
        collectionView?.reloadData()

        print(indexPath.row)
    }
}


extension UICollectionView {
    func setUp(with numberOfItems: CGFloat, scrollDirection: UICollectionViewScrollDirection, padding: CGFloat) {
        let parentSize = scrollDirection == .vertical ? UIScreen.main.bounds.width : UIScreen.main.bounds.height
        let itemSize = (parentSize - padding * 2 - padding * (numberOfItems - 1))/numberOfItems
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = padding
        layout.minimumLineSpacing = padding
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        layout.scrollDirection = scrollDirection
        collectionViewLayout = layout
    }
}
