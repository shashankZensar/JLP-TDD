//
//  ProductPageControllerTest.swift
//  DishWasherApp
//
//  Created by Shashank Dekate on 23/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import XCTest
@testable import DishWasherApp


class ProductPageControllerTest: XCTestCase {
    
    var sut:ProductPageController!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: tMain, bundle: nil)
        sut = storyboard.instantiateViewController(
            withIdentifier: tProductPageController) as! ProductPageController
        _ = sut.view

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_HasPriceLbl() {
        
        
        XCTAssertNotNil(sut.priceLbl)
    }
    
    func test_HasDisplayOfferLbl() {
        
        
        XCTAssertNotNil(sut.displayOfferLbl)
    }
    
    func test_HasIncludeServiceLbl() {
        
        
        XCTAssertNotNil(sut.includeServiceLbl)
    }
    
    func test_HasProductInformationLbl() {
        
        
        XCTAssertNotNil(sut.productInformationLbl)
    }
    
    func test_HasProductCodeLbl() {
        
        
        XCTAssertNotNil(sut.productCodeLbl)
    }
    
    func test_HasProductInformationDataLbl() {
        
        
        XCTAssertNotNil(sut.productInformationDataLbl)
    }
    
    func test_HasProductSpecificationLbl() {
        
        
        XCTAssertNotNil(sut.productSpecificationLbl)
    }
    
    func test_HasProductSpecificationNameLbl() {
        
        
        XCTAssertNotNil(sut.productSpecificationNameLbl)
    }
    
    func test_HasProductSpecificationValueLbl() {
        
        
        XCTAssertNotNil(sut.productSpecificationValueLbl)
    }
    
    func test_HasCollectionView() {
        
        XCTAssertNotNil(sut.collectionView)
    }
    
    func test_LoadingView_SetsDataSourceAndDelegateToSameObject() {
        XCTAssertEqual(sut.collectionView.dataSource as? PageGridDataProvider,
                       sut.collectionView.delegate as? PageGridDataProvider)
    }
    
    func test_HasActivityIndicator() {
    
        XCTAssertNotNil(sut.activityIndicator)
    }
    
    func test_assignProductDetailToLabel(){
    
        let productDetailInfo = ProductDetailInfo(title: tTitle,
                                                                    imageUrl: [tImageUrl],
                                                                    price: kNow,
                                                                    productInformation:tProductInformation,
                                                                    includedServices: tIncludedServices,
                                                                    code:tProductCode,
                                                                    productSpecificationName: tProductSpecificationName,
                                                                    valueOfProductSpecification: tValueOfProductSpecification,
                                                                    displaySpecialOffer: tDisplaySpecialOffer)
        
        
        sut.assignProductDetailToLabel(productDetailinfo: productDetailInfo)
        
        XCTAssertEqual(sut.priceLbl.text, kNow)
        XCTAssertEqual(sut.displayOfferLbl.text, tDisplaySpecialOffer)
        XCTAssertEqual(sut.includeServiceLbl.text, tIncludedServices)
        XCTAssertEqual(sut.productInformationDataLbl.text,tProductInformation)
        XCTAssertEqual(sut.productCodeLbl.text, "Product Code :" + tProductCode)
        XCTAssertEqual(sut.productSpecificationNameLbl.text,tProductSpecificationName)
        XCTAssertEqual(sut.productSpecificationValueLbl.text, tValueOfProductSpecification)
        
    }

}
