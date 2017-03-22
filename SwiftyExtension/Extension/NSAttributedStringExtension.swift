//
//  NSAttributedStringExtension.swift
//  GoldenTime
//
//  Created by Liem Ly Quan on 10/27/16.
//  Copyright © 2016 CAN. All rights reserved.
//

import Foundation

extension NSAttributedString {
    
    // MARK: Return a new NSAttributed title with same attributes 
    func changeText(text: String) -> NSAttributedString {
        let attributes = self.attributes(at: 0, effectiveRange: nil)
        return NSAttributedString(string: text, attributes: attributes)
    }
    
    
}
