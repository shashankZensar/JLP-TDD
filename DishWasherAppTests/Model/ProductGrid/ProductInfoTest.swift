//
//  ProductInfoTest.swift
//  DishWasherApp
//
//  Created by Shashank Dekate on 20/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import XCTest
@testable import DishWasherApp


class ProductInfoTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Init_TakesProductId(){
        
        let product = ProductInfo(productId: "48193")
        XCTAssertEqual(product.productId, "48193", "should set productId")

    }
    
    func test_Init_TakesPrice(){
        
        let price = Price(now:"330")
        let product = ProductInfo(price:price)
        XCTAssertEqual(product.price?.now,"330", "should set Price")
        
    }
    
    func test_Init_TakesTitle(){
        
        let product = ProductInfo(title:"Bosch SMV53M40GB Fully Integrated Dishwasher")
        XCTAssertEqual(product.title, "Bosch SMV53M40GB Fully Integrated Dishwasher", "should set Title")
        
    }
    
    func test_Init_TakesImage(){
        
        let product = ProductInfo(imageUrl:"//johnlewis.scene7.com/is/image/JohnLewis/234326372?")
        XCTAssertEqual(product.imageUrl, "//johnlewis.scene7.com/is/image/JohnLewis/234326372?", "should set Image Url")
        
    }
    
    func test_Items_WhenImageDiffer_AreNotEqual() {
        let first = ProductInfo(imageUrl: "Foo")
        let second = ProductInfo(imageUrl: "Bar")
        
        
        XCTAssertNotEqual(first, second)
    }

    func test_Items_WhenProductIdDiffer_AreNotEqual(){
        let first = ProductInfo(productId: "4518")
        let second = ProductInfo(productId: "8516")
        
        XCTAssertNotEqual(first, second)
    
    }
    
}
