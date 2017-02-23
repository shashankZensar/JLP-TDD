//
//  ProductInfoManager.swift
//  DishWasherApp
//
//  Created by Shashank Dekate on 21/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import Foundation

public class ProductInfoManager{
    
    /**
     This function call Network manager to get product grid data from server
     
     - parameter strUrl: ProductInfo
     
     - parameter completion: completion handler which give array of ProductInfo Object
     
     - returns: No return value
     
     */
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
    
    /**
     This function parse the Dic get from call Network manager
     
     - parameter dic: String as key and AnyObjec as Value
     
     - parameter completion: completion handler which give array of ProductInfo Object
     
     - returns: array of ProductInfo
     
     */
    private func parseTheDic(dic:[String:AnyObject])->[ProductInfo]{
        
        var arrProductInfo: [ProductInfo] = []

        guard let arrProduct = dic[kProducts]else{
            return arrProductInfo
        }
        
        for  i in 0..<arrProduct.count{
            
            guard let dicProduct = arrProduct[i] as? [String:AnyObject]else{
                return arrProductInfo
            }
            
            let productId = dicProduct[kproductId] as? String
            
            //print(productId ?? "")
            
            let title = dicProduct[kTitle] as? String
            
            //print(title ?? "")
            
            let image = dicProduct[kImage] as? String
            
            //print(image ?? "")
            
            let price = dicProduct[kPrice] as? [String:String]
            
            let was = price?[kWas]
            let then1 = price?[kThen1]
            let then2 = price?[kThen2]
            let now = price?[kNow]
            let uom = price?[kUom]
            let currency = price?[kCurrency]
            
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
    
        //print(arrProductInfo.count)
        
        return arrProductInfo
    }



}
