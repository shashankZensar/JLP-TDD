//
//  ProductInfo.swift
//  DishWasherApp
//
//  Created by Shashank Dekate on 20/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import Foundation


struct ProductInfo:Equatable {

    let productId:String?
    let price:Price?
    let title:String?
    let imageUrl:String?
    
    init(productId:String?=nil,price:Price?=nil,title:String?=nil,imageUrl:String?=nil) {
        self.productId = productId
        self.price = price
        self.title = title
        self.imageUrl = imageUrl
    }
    
    static func ==(lhs: ProductInfo, rhs: ProductInfo) -> Bool {
        if lhs.productId != rhs.productId {
            return false
        }
        
        if lhs.imageUrl != rhs.imageUrl {
            return false
        }
        
        if lhs.title != rhs.title {
            return false
        }
        
        return true
    }
    
}
