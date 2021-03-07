//
//  UIImageView+LoadImage.swift
//  Daily Business Digest
//
//  Created by shanaaz begum on 3/6/21.
//

import Foundation
import Alamofire


let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func loadImageFromUrl(urlString: String)  {
        
        // Set image to nil while image is loading in background to prevent wrong image from displaying in reused cell while user is scrolling
        image = nil
        
        // Check whether image is already in cache
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            return
        }
        // If image not in cache, then download image from url
        AF.request(urlString, method: .get).response { (responseData) in
            if let data = responseData.data {
                DispatchQueue.main.async {
                    if let imageToCache = UIImage(data: data) {
                        imageCache.setObject(imageToCache, forKey: urlString as NSString)
                        self.image = imageToCache
                    }
                }
            }
        }
    }
}
