//
//  ProductInfoManagerTest.swift
//  DishWasherApp
//
//  Created by Shashank Dekate on 21/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import XCTest
@testable import DishWasherApp


class ProductInfoManagerTest: XCTestCase {
    
    var sut:ProductInfoManager!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ProductInfoManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func test_arrProductCount_IsGreatherThanZero_WhenStringIsValid(){
        
        let tokenExpectation = expectation(description: "arrProductCount")
        
        var arrProductInfoObj: [ProductInfo] = []

        sut.getTheProductInfo(strUrl: "https://api.johnlewis.com/v1/products/search?q=dishwasher&key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb&pageSize=20") { (arrProductInfo) in
            
            arrProductInfoObj = arrProductInfo
            
            print(arrProductInfo)

            tokenExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 3) { (error) in
            
            XCTAssert(arrProductInfoObj.count>0,"should count be greather than one")
        
        }

    }
    
    func test_arrProductCount_IsZero_WhenStringIsInValid(){
        
        let tokenExpectation = expectation(description: "arrProductCount")
        
        var arrProductInfoObj: [ProductInfo] = []
        
        sut.getTheProductInfo(strUrl: "https://api.johnlewis.com/v1/products/search?q=dishwasher") { (arrProductInfo) in
            
            arrProductInfoObj = arrProductInfo
            
            print(arrProductInfo)
            
            tokenExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 3) { (error) in
            
            XCTAssert(arrProductInfoObj.count == 0,"should count be greather than one")
            
        }
        
    
    }
    
}
