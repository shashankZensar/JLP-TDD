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
        
        let productDetail = ProductDetailInfo(title: "Bosch SMV53M40GB Fully Integrated Dishwasher")
        XCTAssertEqual(productDetail.title, "Bosch SMV53M40GB Fully Integrated Dishwasher", "should set title")

    }
    
    func test_Init_TakesMedia(){
        
        let productDetail = ProductDetailInfo(imageUrl: ["//johnlewis.scene7.com/is/image/JohnLewis/234326372?"])
        XCTAssertEqual(productDetail.imageUrl?.count,1, "should set media")
        
    }
    
    func test_Init_TakesPrice(){
        
        let productDetail = ProductDetailInfo(price: "499.00")
        XCTAssertEqual(productDetail.price, "499.00", "should set price")
        
    }
    
    func test_Init_TakesProductInformation(){
        
        let productDetail = ProductDetailInfo(productInformation: "this product used to wash a dish")
        XCTAssertEqual(productDetail.productInformation, "this product used to wash a dish", "should set ProductInformation")
        
    }
    
    func test_Init_TakesIncludedServices(){
        
        let productDetail = ProductDetailInfo(includedServices: "2 year guarantee included")
        XCTAssertEqual(productDetail.includedServices, "2 year guarantee included", "should set IncludedServices")
        
    }
    
    func test_Init_TakesCode(){
        
        let productDetail = ProductDetailInfo(code: "88701205")
        XCTAssertEqual(productDetail.code, "88701205", "should set TakesCode")
        
    }
    
    func test_Init_TakesProductSpecificationName(){
        
        let productDetail = ProductDetailInfo(productSpecificationName: "Dimensions")
        XCTAssertEqual(productDetail.productSpecificationName, "Dimensions", "should set ProductSpecificationName")
        
    }
    
    func test_Init_TakesValueOfProductSpecification(){
        
        let productDetail = ProductDetailInfo(valueOfProductSpecification: "H81.5 x W59.8 x D55cm")
        XCTAssertEqual(productDetail.valueOfProductSpecification, "H81.5 x W59.8 x D55cm", "ProductSpecification")
        
    }
    
}
