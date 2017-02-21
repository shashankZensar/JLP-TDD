//
//  ProductDetailInfo.swift
//  DishWasherApp
//
//  Created by Shashank Dekate on 20/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import Foundation

struct  ProductDetailInfo{
    
    let title:String?
    let imageUrl:[String]?
    let price:String?
    let productInformation:String?
    let displaySpecialOffer:String?
    let includedServices:String?
    let code:String?
    let productSpecificationName:String?
    let valueOfProductSpecification:String?
    
    init(title:String?=nil,
         imageUrl:[String]?=nil,
         price:String?=nil,
         productInformation:String?=nil,
         includedServices:String?=nil,
         code:String?=nil,
         productSpecificationName:String?=nil,
         valueOfProductSpecification:String?=nil,displaySpecialOffer:String?=nil) {
        
        self.title = title
        self.imageUrl = imageUrl
        self.price = price
        self.productInformation = productInformation
        self.includedServices = includedServices
        self.code = code
        self.displaySpecialOffer = displaySpecialOffer
        self.productSpecificationName = productSpecificationName
        self.valueOfProductSpecification = valueOfProductSpecification

        
    }
    
    
}
