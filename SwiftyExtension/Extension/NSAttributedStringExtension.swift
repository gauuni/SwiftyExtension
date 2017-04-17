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
    
    func addAttribute(name: String, value: Any, at string: String){
        let range = (self.string as NSString).range(of: string)
        self.addAttribute(name: name, value: <#T##Any#>, at: <#T##String#>)
    }
    
}

public extension NSMutableAttributedString{
    
    func change(string : String, with color: UIColor){
        self.addAttribute(name: NSForegroundColorAttributeName, value: color, at: string)
    }
    
    func addAttribute(name: String, value: Any, at string: String){
        let range = (self.string as NSString).range(of: string)
        self.addAttribute(name, value: value, range: range)
    }
    
}
