//
//  PriceTest.swift
//  DishWasherApp
//
//  Created by Shashank Dekate on 20/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import XCTest
@testable import DishWasherApp


class PriceTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Init_TakesWas() {
        let price = Price(was: "48193")
        XCTAssertEqual(price.was, "48193", "should set was")
    }
    
    func test_Init_TakesThen1() {
        let price = Price(then1: "48193")
        XCTAssertEqual(price.then1, "48193", "should set then1")
    }
    
    func test_Init_TakestThen2() {
        let price = Price(then2: "48193")
        XCTAssertEqual(price.then2, "48193", "should set then2")
    }
    
    func test_Init_TakesNow() {
        let price = Price(now: "383")
        XCTAssertEqual(price.now, "383", "should set now")
        
    }
    
    func test_Init_TakesUom() {
        let price = Price(uom: "383")
        XCTAssertEqual(price.uom, "383", "should set uom")
        
    }
    
    func test_Init_TakesCurrency() {
        let price = Price(currency: "INR")
        XCTAssertEqual(price.currency, "INR", "should set currency")
    }
}
