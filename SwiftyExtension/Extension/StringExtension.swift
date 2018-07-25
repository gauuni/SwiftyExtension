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
    
    func replace(target: String, withString: String) -> String{
        return self.replacingOccurrences(of: target, with: withString)
    }
    
    func encode(characters: CharacterSet = .urlQueryAllowed) -> String{
        return self.addingPercentEncoding(withAllowedCharacters: characters) ?? self
    }
    
    func decode() -> String{
        return self.removingPercentEncoding ?? self
    }
    
    var strippingHTML : String{
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
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

    /*
     Convert string to date
     **/
    func date(with custom: String) -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = custom
        
        return dateFormatter.date(from: self)
    }
    
    var hexadecimal: Data? {
        var data = Data(capacity: self.count / 2)
        
        let regex = try! NSRegularExpression(pattern: "[0-9a-f]{1,2}", options: .caseInsensitive)
        regex.enumerateMatches(in: self, range: NSMakeRange(0, utf16.count)) { match, flags, stop in
            let byteString = (self as NSString).substring(with: match!.range)
            var num = UInt8(byteString, radix: 16)!
            data.append(&num, count: 1)
        }
        
        guard data.count > 0 else { return nil }
        
        return data
    }
    
    var data: Data?{
        return self.data(using: String.Encoding.utf8)
    }
    
    var trim: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
}
