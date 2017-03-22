//
//  UIImageViewExtension.swift
//  GoldenTime
//
//  Created by Liem Ly Quan on 9/16/16.
//  Copyright © 2016 CAN. All rights reserved.
//

import UIKit

/*
extension UIImageView {
    
    func fillImage(image: UIImage, withColor color: UIColor = UIColor.blackColor(), alpha: CGFloat=0.5){
        let renderImage = image.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        self.alpha = alpha
        self.image = renderImage
        self.tintColor = color
    }
    
    // MARK: Set child image using url String
    func setChildImage(urlString: String){
        let defaultImage = UIImage(named: GlobalData.Constant.defaultImageName)
        if let url = NSURL(string: urlString) {
            self.af_setImageWithURL(url, placeholderImage: defaultImage)
        }
    }
    
    func downloadImageFrom(urlString: String,
                           success: (downloadedImage: UIImage?) -> ()){
        guard let imageURL = NSURL(string: urlString) else{
            success(downloadedImage: nil)
            return
        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)){
            guard let imageData = NSData(contentsOfURL: imageURL) else{
                dispatch_async(dispatch_get_main_queue()){
                    success(downloadedImage: nil)
                }
                
                return
            }
            
            guard let image = UIImage(data: imageData) else{
                dispatch_async(dispatch_get_main_queue()){
                    success(downloadedImage: nil)
                }
                return
            }
            
            dispatch_async(dispatch_get_main_queue()){
                success(downloadedImage: image)
            }
        }
    }
    
    func add(target: AnyObject, action: Selector){
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        self.addGestureRecognizer(tapGesture)
        self.userInteractionEnabled = true
    }
 
}*/
