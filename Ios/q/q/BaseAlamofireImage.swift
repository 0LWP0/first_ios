//
//  BaseAlamofireImage.swift
//  q
//
//  Created by qli on 2016/11/20.
//  Copyright © 2016年 qli. All rights reserved.
//

import Foundation

import Alamofire
import AlamofireImage


class BaseAlamofireImage: NSObject {
    
    fileprivate static var im: ImageProrocol!
    
    var imagex: UIImage?
    fileprivate static let imageFilter = RoundedCornersFilter(radius: 10.0)
    // AlamofireImage cache with 30 MB cache
    fileprivate static let imageCache = AutoPurgingImageCache(
        memoryCapacity: 30 * 1024 * 1024,
        preferredMemoryUsageAfterPurge: 20 * 1024 * 1024
    )
    
    static func getImage(_ url: String,uiimage: UIImageView)  {
        
//        uiimage.backgroundColor = UIColor.gray
        Alamofire.request(url).responseImage { response in

            
            switch(response.result){
            case .success:
//                uiimage.backgroundColor = UIColor.clear
                let image = UIImage(data: response.data!)
                uiimage.image = image
                break
                
            case.failure:
                uiimage.backgroundColor = UIColor.gray
                break
            
            }
            
        }
                
    }
    // 缓存图片
    static func loadImage(_ imageURL: String,uiimage: UIImageView){
        let urlRequest = URLRequest(url: URL(string: imageURL)!)
        let image = self.imageCache.image(for: urlRequest, withIdentifier: imageURL)
        
        if image != nil {
            uiimage.image = image
            
            print("cache")
        }else{
              print("no cache")
            Alamofire.request(imageURL).responseImage { response in
                
                
                switch(response.result){
                case .success:
                    let image = UIImage(data: response.data!)
                    uiimage.image = image
                    self.imageCache.add(image!, for: urlRequest, withIdentifier: imageURL)
                    break
                    
                case.failure:
                    uiimage.backgroundColor = UIColor.gray

                    break
                    
                }
                
            }
            
        }

    }
    
    
    //图片加入缓存 返回值判断是否缓存成功
    static func CacheImage(image: UIImage,imageUrl: String) -> Bool{
        let urlRequest = URLRequest(url: URL(string: imageUrl)!)
        
        let image = self.imageCache.image(for: urlRequest, withIdentifier: imageUrl)
        
        if image == nil{
            self.imageCache.add(image!, for: urlRequest, withIdentifier: imageUrl)
            return true
        }
        
        return false
        
       
    }
    
    //图片缓存读取
    static func FetchImage(_ imageUrl: String,uiimage: UIImageView) {
        let urlRequest = URLRequest(url: URL(string: imageUrl)!)
        let cachedAvatarImage = imageCache.image(for: urlRequest, withIdentifier: imageUrl)
        
        if cachedAvatarImage == nil {
            
            uiimage.backgroundColor = UIColor.gray
        }else{
            uiimage.image  = cachedAvatarImage
        }
    }

    //图片缓存删除
    static func RemoveImage(_ imageUrl: String){
    
        let urlRequest = URLRequest(url: URL(string: imageUrl)!)
        let cachedAvatarImage = imageCache.image(for: urlRequest, withIdentifier: imageUrl)
        
        if cachedAvatarImage != nil {
            imageCache.removeImage(for: urlRequest, withIdentifier: imageUrl)
        }
    }
    

    
    static func getImageArray(_ urls: [String])  {
        var i: [UIImage] = []
        var count = 0;
        
        for url in urls {
            
            Alamofire.request(url).responseImage { response in
                count += 1

                switch(response.result){
                case .success:
                    i.append(response.result.value!)

                    if (count == urls.count){
                    
                        if im != nil{
                            im.getSuccess(i)
                            im = nil
                        }
                        
                    }
                    break
                    
                case.failure:
                    if im != nil{
                    im.getError(response.result.error)
                    
                    }
                    
                    break
                    
                }
            }
        }
   
    }

    static func setImageListenter(_ iml: ImageProrocol!){
    
        self.im = iml
    
    }
    
    
}
