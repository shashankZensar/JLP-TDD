//
//  ProductInfo.swift
//  DishWasherApp
//
//  Created by Shashank Dekate on 20/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import Foundation


struct ProductInfo:Equatable {

    // MARK: - Global Data Variable
    
    let productId:String? // Contain product Id
    let price:Price?      // Price object
    let title:String?     // title product
    let imageUrl:String?  // Contain url of Image
    
    
    /**
     Initializer for ProductInfo.
     
     - parameter productId: product ID
     
     - parameter imageUrl: arr of product imageUrl
     
     - parameter title: product productInformation
     
     - parameter price: product price
     
     */
    init(productId:String?=nil,price:Price?=nil,title:String?=nil,imageUrl:String?=nil) {
        self.productId = productId
        self.price = price
        self.title = title
        self.imageUrl = imageUrl
    }
    
    
    /**
     Equtable Protocol
     
     - parameter lhs: ProductInfo
     
     - parameter rhs: ProductInfo
    
     - returns: Bool
     
     */
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
