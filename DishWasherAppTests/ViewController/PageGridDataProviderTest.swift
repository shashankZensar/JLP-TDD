//
//  PageGridDataProviderTest.swift
//  DishWasherApp
//
//  Created by Zensar Technologies1 on 21/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import XCTest
@testable import DishWasherApp

class PageGridDataProviderTest: XCTestCase {
    
    var sut: PageGridDataProvider!
    var collectionView: UICollectionView!
    var controller: PageGridViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = PageGridDataProvider()        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(
            withIdentifier: "PageGridViewController") as! PageGridViewController
        
        _ = controller.view
        
        collectionView = controller.collectionView
        collectionView.dataSource = sut
        collectionView.delegate = sut
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func test_NumberOfItems_InSection() {
        
        sut.arrProductInfoObj.append(ProductInfo(productId: "678", price:Price(was: "", then1: "", then2: "", now: "567", uom: "", currency: "INR"), title: "Dishwashher", imageUrl:"https://google.com"))
        
        XCTAssertEqual(collectionView.numberOfItems(inSection: 0), 1)
        
        sut.arrProductInfoObj.append(ProductInfo(productId: "678", price:Price(was: "", then1: "", then2: "", now: "567", uom: "", currency: "INR"), title: "Dishwashher", imageUrl:"https://google.com"))
        
        collectionView.reloadData()
        
        XCTAssertEqual(collectionView.numberOfItems(inSection: 0), 2)

    }
    
    func test_CellForRow_ReturnsItemCell() {
        
        sut.arrProductInfoObj.append(ProductInfo(productId: "678", price:Price(was: "", then1: "", then2: "", now: "567", uom: "", currency: "INR"), title: "Dishwashher", imageUrl:"https://google.com"))
        
        collectionView.reloadData()
        
        print(collectionView.numberOfItems(inSection: 0))
        
        let cell = collectionView.cellForItem(at: IndexPath(item: 0, section: 0))
        
        
        XCTAssertTrue(cell is PageGridCollectionCell)
    }
    
    
}

extension PageGridDataProviderTest {
    
    class MockCollectionView: UICollectionView {
        var cellGotDequeued = false
        
        
        override func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell {
            
            cellGotDequeued = true
            
            return super.dequeueReusableCell(withReuseIdentifier:identifier, for: indexPath)
            
            
        }
        
    }
}
