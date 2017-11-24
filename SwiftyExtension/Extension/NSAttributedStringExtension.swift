//
//  NSAttributedStringExtension.swift
//  GoldenTime
//
//  Created by Liem Ly Quan on 10/27/16.
//  Copyright © 2016 CAN. All rights reserved.
//

import UIKit

public extension NSAttributedString {
    
    // MARK: Return a new NSAttributed title with same attributes 
    func changeText(text: String) -> NSAttributedString {
        let attributes = self.attributes(at: 0, effectiveRange: nil)
        return NSAttributedString(string: text, attributes: attributes)
    }
}

public extension NSMutableAttributedString{
    
    func change(string : String, with color: UIColor){
        self.addAttribute(name: NSAttributedStringKey.foregroundColor.rawValue, value: color, at: string)
    }
    
    func addAttribute(name: String, value: Any, at string: String){
        let range = (self.string as NSString).range(of: string)
        self.addAttribute(NSAttributedStringKey(rawValue: name), value: value, range: range)
    }
    
}
