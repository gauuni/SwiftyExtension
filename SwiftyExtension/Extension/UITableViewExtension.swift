//
//  UITableViewExtension.swift
//  SwiftyExtension
//
//  Created by Khoi Nguyen on 4/23/17.
//  Copyright © 2017 Nguyen. All rights reserved.
//

import UIKit

public extension UITableView{
    func registerCellNib(cellClass: AnyClass) {
        let identifier = String.className(aClass: cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
    
    func registerHeaderNib(headerClass: AnyClass) {
        let identifier = String.className(aClass: headerClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    func dequeueReusableCell(cellClass: AnyClass) -> UITableViewCell?{
        let identifier = String.className(aClass: cellClass)
        return self.dequeueReusableCell(withIdentifier: identifier)
    }
    
    func dequeueReusableHeader(headerClass: AnyClass) -> UITableViewHeaderFooterView?{
        let identifier = String.className(aClass: headerClass)
        return self.dequeueReusableHeaderFooterView(withIdentifier: identifier)
    }
}
