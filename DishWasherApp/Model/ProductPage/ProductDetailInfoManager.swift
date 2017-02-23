//
//  ProductDetailInfoManager.swift
//  DishWasherApp
//
//  Created by Shashank Dekate on 21/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import Foundation

class ProductDetailInfoManager{
    
    
    // MARK: - Class methods

    
    /**
     This function called NetworkManager Inorder to get data from server.
     
     - parameter productID: product ID
     
     - parameter completion: completion handler which give ProductDetailInfo object after sucessfull server parse
     
     - returns: No Return Value
     
     */
    
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
            
            //print(dic)
            
            let arrProductDetailInfo = self.parseTheDic(dic: dic)
            
            completion(arrProductDetailInfo)
            
        }
        
    }
    

    /**
     This private function called parse the dictionary and give data in form ProductDetailInfoObj.
     
     - parameter dic: dic get from NetworkManager manger after getting server Response
     
     - parameter completion: completion handler which give ProductDetailInfo object after sucessfull server parse
     
     - returns: No Return Value
     
     */
    private func parseTheDic(dic:[String:AnyObject])->ProductDetailInfo{
        
        let title = dic[kTitle] as? String
        

        let media = dic[kMedia] as? [String:AnyObject]
        

        let images = media?[kImages] as? [String:AnyObject]
        
        let imagesUrl = images?[kUrls] as? [String]
        
        
        //print(imagesUrl ?? [])
        
        let priceObj = dic[kPrice] as? [String:String]
        
        let price = priceObj?[kNow]
        

        
        let detail = dic[kDetails] as? [String:AnyObject]
        
        let productInformation = detail?[kProductInformation] as? String
        
        //print(productInformation ?? "")

        
        let displaySpecialOffer = dic[kDisplaySpecialOffer] as? String
        
        //print(displaySpecialOffer ?? "")

        
        let code = dic[kCode] as? String
        
        //print(code ?? "")

        
        let additionalServices = dic[kAdditionalServices] as? [String:AnyObject]
        
        
        
        let arrIncludedServices = additionalServices?[kIncludedServices] as? [String]
        
        let includedServices = arrIncludedServices?[0]
        
        //print(includedServices ?? "")

        
        let feature = detail?[kFeatures] as? [AnyObject]
        
        //print(feature?[0] ?? [])
        
        let attributes = feature?[0][kAttributes] as? [AnyObject]
        
        //print(attributes ?? [])
        
        let productSpecificationName = attributes?[0][kName] as? String
        
        let valueOfProductSpecification = attributes?[0][kValue] as? String
        
       //print(productSpecificationName ?? "")
        
        //print(valueOfProductSpecification ?? "")

        
        
        
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
