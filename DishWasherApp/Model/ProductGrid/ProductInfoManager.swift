//
//  ProductInfoManager.swift
//  DishWasherApp
//
//  Created by Shashank Dekate on 21/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import Foundation

public class ProductInfoManager{
    
    func getTheProductInfo(strUrl:String,completion: @escaping (Array<ProductInfo>) -> Void){
        
        let networkManagerObj = NetWorkManager()
        
        networkManagerObj.getDataFromServer(strUrl:strUrl) { (dic, error) in
            
            guard error == nil else {
                completion([]);
                return
            }
            
            guard let dic = dic else {
                completion([])
                return
            }
            
            let arrProductInfo = self.parseTheDic(dic: dic)
            
            completion(arrProductInfo)
            
        }
        
    }
    
    private func parseTheDic(dic:[String:AnyObject])->[ProductInfo]{
        
        var arrProductInfo: [ProductInfo] = []

        guard let arrProduct = dic["products"]else{
            return arrProductInfo
        }
        
        for  i in 0..<arrProduct.count{
            
            guard let dicProduct = arrProduct[i] as? [String:AnyObject]else{
                return arrProductInfo
            }
            
            let productId = dicProduct["productId"] as? String
            
            print(productId ?? "")
            
            let title = dicProduct["title"] as? String
            
            print(title ?? "")
            
            let image = dicProduct["image"] as? String
            
            print(image ?? "")
            
            let price = dicProduct["price"] as? [String:String]
            
            let was = price?["was"]
            let then1 = price?["then1"]
            let then2 = price?["then2"]
            let now = price?["now"]
            let uom = price?["uom"]
            let currency = price?["currency"]
            
            let priceObj = Price(was: was,
                                 then1: then1,
                                 then2: then2,
                                 now: now,
                                 uom: uom,
                                 currency: currency)
            
            let productInfoObj = ProductInfo(productId: productId,
                                             price: priceObj,
                                             title: title,
                                             imageUrl: image)
            
            
            
            arrProductInfo.append(productInfoObj)
        }
    
        print(arrProductInfo.count)
        
        return arrProductInfo
    }



}
