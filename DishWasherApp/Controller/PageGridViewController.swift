//
//  PageGridViewController.swift
//  DishWasherApp
//
//  Created by Zensar Technologies1 on 21/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import UIKit

class PageGridViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var dataProvider:PageGridDataProvider!
    
    var arrProductInfoObj: [ProductInfo] = []
    
    var productInfoManagerObj = ProductInfoManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataProvider.view = self.view
        
        activityIndicator.startAnimating()
        collectionView.dataSource = dataProvider
        collectionView.delegate = dataProvider
        
        productInfoManagerObj.getTheProductInfo(strUrl:"https://api.johnlewis.com/v1/products/search?q=dishwasher&key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb&pageSize=20") { (arrProductInfo) in
            
            DispatchQueue.main.async() {
                self.arrProductInfoObj = arrProductInfo
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.dataProvider.arrProductInfoObj = arrProductInfo
                self.collectionView.reloadData()
            }
            
        }
        

        // Do any additional setup after loading the view.
    }

}
