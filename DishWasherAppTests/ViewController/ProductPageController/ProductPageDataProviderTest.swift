//
//  ProductPageDataProviderTest.swift
//  DishWasherApp
//
//  Created by Zensar Technologies1 on 23/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import XCTest
@testable import DishWasherApp

class ProductPageDataProviderTest: XCTestCase {
    
    var sut: ProductPageDataProvider!
    var collectionView: UICollectionView!
    var controller: ProductPageController!

    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = ProductPageDataProvider()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(
            withIdentifier: "ProductPageController") as! ProductPageController
        
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
        
        sut.imageUrl.append(tImageUrl)
        
        
        XCTAssertEqual(collectionView.numberOfItems(inSection: 0), 1)
        
        sut.imageUrl.append(tImageUrl)
        
        collectionView.reloadData()
        
        XCTAssertEqual(collectionView.numberOfItems(inSection: 0), 2)
        
    }
    
    func test_CellForRow_ReturnsItemCell() {
        
        sut.imageUrl.append(tImageUrl)
        
        collectionView.reloadData()
        
        //        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        //        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        //        layout.itemSize = CGSize(width: 90, height: 120)
        //
        //        self.collectionView.setCollectionViewLayout(layout, animated: true)
        
        let cell = self.collectionView.cellForItem(at: IndexPath(row: 0, section: 0))
        
        
        XCTAssertTrue(cell is PageGridCollectionCell)
    }
    
    
}
