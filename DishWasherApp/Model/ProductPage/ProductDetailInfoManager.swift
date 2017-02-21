//
//  ProductDetailInfoManager.swift
//  DishWasherApp
//
//  Created by Shashank Dekate on 21/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import Foundation

class ProductDetailInfoManager{
    
    func getTheProductDetailInfo(productID:String,completion: @escaping (ProductDetailInfo) -> Void){
        
        let strUrl = "https://api.johnlewis.com/v1/products/\(productID)?key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb"
        
        
        let networkManagerObj = NetWorkManager()
        
        networkManagerObj.getDataFromServer(strUrl:strUrl) { (dic, error) in
            
            guard error == nil else {
                completion(ProductDetailInfo());
                return
            }
            
            guard let dic = dic else {
                completion(ProductDetailInfo())
                return
            }
            
            print(dic)
            
            let arrProductDetailInfo = self.parseTheDic(dic: dic)
            
            completion(arrProductDetailInfo)
            
        }
        
    }
    
    private func parseTheDic(dic:[String:AnyObject])->ProductDetailInfo{
        
        let title = dic["title"] as? String
        
        print(title ?? "")

        let media = dic["media"] as? [String:AnyObject]
        
        
        
        let images = media?["images"] as? [String:AnyObject]
        
        let imagesUrl = images?["urls"] as? [String]
        
        
        print(imagesUrl ?? [])
        
        let priceObj = dic["price"] as? [String:String]
        
        let price = priceObj?["now"]
        
        print(price ?? "")

        
        let detail = dic["details"] as? [String:AnyObject]
        
        let productInformation = detail?["productInformation"] as? String
        
        print(productInformation ?? "")

        
        let displaySpecialOffer = dic["displaySpecialOffer"] as? String
        
        print(displaySpecialOffer ?? "")

        
        let code = dic["code"] as? String
        
        print(code ?? "")

        
        let additionalServices = dic["additionalServices"] as? [String:AnyObject]
        
        
        
        let arrIncludedServices = additionalServices?["includedServices"] as? [String]
        
        let includedServices = arrIncludedServices?[0]
        
        print(includedServices ?? "")

        
        let feature = detail?["features"] as? [AnyObject]
        
        print(feature?[0] ?? [])
        
        let attributes = feature?[0]["attributes"] as? [AnyObject]
        
        print(attributes ?? [])
        
        let productSpecificationName = attributes?[0]["name"] as? String
        
        let valueOfProductSpecification = attributes?[0]["value"] as? String
        
       print(productSpecificationName ?? "")
        
        print(valueOfProductSpecification ?? "")

        
        
        
        return ProductDetailInfo(title: title,
                                 imageUrl: imagesUrl,
                                 price: price,
                                 productInformation: productInformation,
                                 includedServices: includedServices,
                                 code: code,
                                 productSpecificationName: productSpecificationName,
                                 valueOfProductSpecification: valueOfProductSpecification,
                                 displaySpecialOffer: displaySpecialOffer)
    }


}
