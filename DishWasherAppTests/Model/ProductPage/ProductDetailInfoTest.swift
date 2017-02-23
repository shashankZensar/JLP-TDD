//
//  ProductDetailInfoTest.swift
//  DishWasherApp
//
//  Created by Shashank Dekate on 20/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import XCTest
@testable import DishWasherApp

class ProductDetailInfoTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Init_TakesTitle(){
        
        let productDetail = ProductDetailInfo(title: tTitle)
        XCTAssertEqual(productDetail.title,tTitle)

    }
    
    func test_Init_TakesMedia(){
        
        let productDetail = ProductDetailInfo(imageUrl: [tImageUrl])
        XCTAssertEqual(productDetail.imageUrl?.count,1, "should set media")
        
    }
    
    func test_Init_TakesPrice(){
        
        let productDetail = ProductDetailInfo(price:kNow)
        XCTAssertEqual(productDetail.price, kNow, "should set price")
        
    }
    
    func test_Init_TakesProductInformation(){
        
        let productDetail = ProductDetailInfo(productInformation: tProductInformation)
        XCTAssertEqual(productDetail.productInformation,tProductInformation)
        
    }
    
    func test_Init_TakesIncludedServices(){
        
        let productDetail = ProductDetailInfo(includedServices: tIncludedServices)
        XCTAssertEqual(productDetail.includedServices, tIncludedServices)
        
    }
    
    func test_Init_TakesCode(){
        
        let productDetail = ProductDetailInfo(code: tProductCode)
        XCTAssertEqual(productDetail.code, tProductCode, "should set TakesCode")
        
    }
    
    func test_Init_TakesProductSpecificationName(){
        
        let productDetail = ProductDetailInfo(productSpecificationName:tProductSpecificationName)
        XCTAssertEqual(productDetail.productSpecificationName, tProductSpecificationName)
        
    }
    
    func test_Init_TakesValueOfProductSpecification(){
        
        let productDetail = ProductDetailInfo(valueOfProductSpecification: tValueOfProductSpecification)
        XCTAssertEqual(productDetail.valueOfProductSpecification, tValueOfProductSpecification)
        
    }
    
}
