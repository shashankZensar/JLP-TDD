//
//  ProductDetailInfoManagerTest.swift
//  DishWasherApp
//
//  Created by Shashank Dekate on 21/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import XCTest
@testable import DishWasherApp


class ProductDetailInfoManagerTest: XCTestCase {
    
    var sut:ProductDetailInfoManager!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ProductDetailInfoManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func test_productDetailInfo_WhenProductIDIsValid(){
        
        let tokenExpectation = expectation(description: "Product Detail Info")
        
        var productDetailInfoObj = ProductDetailInfo()
        
        sut.getTheProductDetailInfo(productID:"1913470") { (productDetailInfo) in
            
            productDetailInfoObj = productDetailInfo
            
            print(productDetailInfoObj.title ?? "")
            
            tokenExpectation.fulfill()
            
        }
        
        waitForExpectations(timeout: 3) { (error) in
            XCTAssertEqual(productDetailInfoObj.title,"Bosch SMV53M40GB Fully Integrated Dishwasher")
            XCTAssertEqual(productDetailInfoObj.price,"499.00")
            XCTAssertEqual(productDetailInfoObj.displaySpecialOffer,"")
            XCTAssertEqual(productDetailInfoObj.includedServices,"2 year guarantee included")
            XCTAssertEqual(productDetailInfoObj.code,"88701205")
            XCTAssertEqual(productDetailInfoObj.productSpecificationName,"Dimensions")
            XCTAssertEqual(productDetailInfoObj.valueOfProductSpecification,"H81.5 x W59.8 x D55cm")
            
        }
        
    }
    
    
    
    func test_productDetailInfo_WhenProductIDIsInValid(){
        
        let tokenExpectation = expectation(description: "Product Detail Info")
        
        var productDetailInfoObj = ProductDetailInfo()
        
        sut.getTheProductDetailInfo(productID:"1913") { (productDetailInfo) in
            
            productDetailInfoObj = productDetailInfo
            
            print(productDetailInfoObj.title ?? "")
            
            tokenExpectation.fulfill()
            
        }
        
        waitForExpectations(timeout: 3) { (error) in
            XCTAssertNil(productDetailInfoObj.title)
            XCTAssertNil(productDetailInfoObj.price)
            XCTAssertNil(productDetailInfoObj.displaySpecialOffer)
            XCTAssertNil(productDetailInfoObj.includedServices)
            XCTAssertNil(productDetailInfoObj.code)
            XCTAssertNil(productDetailInfoObj.productSpecificationName)
            XCTAssertNil(productDetailInfoObj.valueOfProductSpecification)

        }
        
    }
    
}
    
    

