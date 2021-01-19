//
//  UICollectionView+Utils.swift
//  TheMovieApp
//
//  Created by Miguel Duran on 19-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import Foundation
import UIKit

public extension UICollectionView {
    func registerCell(withClass cellClass: UICollectionViewCell.Type) {
        register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass))
    }

    func dequeueReusableCell<CellType: UICollectionViewCell>(at indexPath: IndexPath) -> CellType {
        let identifier = String(describing: CellType.self)
        return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CellType
    }
}
