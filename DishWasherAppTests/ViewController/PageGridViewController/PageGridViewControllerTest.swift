//
//  PageGridViewControllerTest.swift
//  DishWasherApp
//
//  Created by Zensar Technologies1 on 21/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import XCTest
@testable import DishWasherApp

class PageGridViewControllerTest: XCTestCase {
    
    var sut:PageGridViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: tMain, bundle: nil)
        let viewController = storyboard.instantiateViewController(
            withIdentifier: tPageGridViewController)
         sut = viewController as! PageGridViewController
        _ = sut.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_CollectionViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(sut.collectionView)
    }
    
    
    func test_LoadingView_SetsCollectionViewDataSource() {
        XCTAssertTrue(sut.collectionView.dataSource is PageGridDataProvider)
    }
    
    func test_LoadingView_SetsDataSourceAndDelegateToSameObject() {
        XCTAssertEqual(sut.collectionView.dataSource as? PageGridDataProvider,
                       sut.collectionView.delegate as? PageGridDataProvider)
    }
    
    func test_HasActivityIndicator() {
        XCTAssertNotNil(sut.activityIndicator)
    }
    
}
