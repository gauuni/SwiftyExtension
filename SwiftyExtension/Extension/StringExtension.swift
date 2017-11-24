//
//  StringExtension.swift
//  GoldenTime
//
//  Created by Liem Ly Quan on 9/6/16.
//  Copyright © 2016 CAN. All rights reserved.
//
import UIKit

public extension String {
    
    /*
     get length of string
     **/
    var length: Int {
        return self.count
    }
    
    subscript (i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
//        let start = startIndex.advancedBy(r.startIndex)
//        let end = start.advancedBy(r.endIndex - r.startIndex)
//        return self[Range(start ..< end)]
        
        let start = self.index(startIndex, offsetBy: r.lowerBound)
        let end = self.index(start, offsetBy: r.upperBound - r.lowerBound)
        return String(self[Range.init(uncheckedBounds: (lower: start, upper: end))])
    }
    
    //
    // MARK: - Operation
    /**
     Substring from specific index
     
     - parameter from: Index
     
     - returns: Substring value
     */
    func substringFrom(index: Int) -> String {
        let advancedIndex = self.index(startIndex, offsetBy: index)
        return String(self[advancedIndex...])
    }
    
    /**
     Substring to specific index
     
     - parameter to: Index
     
     - returns: Substring value
     */
    func substringTo(index: Int) -> String {
        let advancedIndex = self.index(startIndex, offsetBy: index)
        return String(self[...advancedIndex])
    }
    
    /*
     get range of a specific string in string
     **/
    func rangeOfAString(string: String)->NSRange{
        return (self as NSString).range(of: string)
    }
    
    /*
     get string from class name
     **/
    static func className(aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    //
    // MARK: - Calculating
    func widthWithConstrainedHeight(height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: height)
        
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }

    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return boundingBox.height
    }
    
    //
    // MARK: - Stylize
    
    /*
     Underline text
     **/
    func underlineText(color: UIColor) -> NSAttributedString{
        let titleString = NSMutableAttributedString(string: self)
        titleString.addAttribute(NSAttributedStringKey.underlineStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(0, self.count))
        titleString.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: NSMakeRange(0, self.count))
        return titleString
    }
    
    // MARK: Return localized version of string
    var localized: String {
        get {
            var lang:String
            if let langString = UserDefaults.standard.string(forKey: "lang") {
                lang = langString
            } else {
                lang = "Base"
            }
            
            let path = Bundle.main.path(forResource: lang, ofType: "lproj")
            let bundle = Bundle(path: path!)
            
            return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
        }
    }
    
    
    

    
    
    
}
