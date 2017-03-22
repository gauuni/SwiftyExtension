//
//  UICollectionViewExtension.swift
//  GoldenTime
//
//  Created by Liem Ly Quan on 10/6/16.
//  Copyright © 2016 CAN. All rights reserved.
//
import UIKit

extension UICollectionView {
    func registerCellNib(cellClass: AnyClass) {
        let identifier = String.className(aClass: cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: identifier)
    }
}
