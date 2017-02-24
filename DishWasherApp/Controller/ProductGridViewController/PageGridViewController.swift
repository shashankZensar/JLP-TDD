//
//  PageGridViewController.swift
//  DishWasherApp
//
//  Created by Zensar Technologies1 on 21/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import UIKit

class PageGridViewController: UIViewController,collectionViewActionDelegate {
    
    // MARK: - IBOutlet
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var dataProvider:PageGridDataProvider!// DataSource and Delegate Object for collection View
    
    // MARK: - Global Data Variable
    var arrProductInfoObj: [ProductInfo] = [] // array contain product info object
    var productInfoManagerObj = ProductInfoManager() // Initializating ProductInfoManager
    
    
    // MARK: - ViewController Function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupDataSourceAndDelegate()
        self.getProductlist()
        self.navigationItem.title = kDishWashers
    }
    
    override func viewWillAppear(_ animated: Bool) {
            self.navigationItem.title = kDishWashers
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.title = ""
        self.navigationItem.backBarButtonItem?.title = ""
    }
    
    // MARK: - collectionViewActionDelegate Function
    
    /**
     collectionViewActionDelegate Protocol function called when collection View Cell selected by used. This function will navigate to product detail page Controller
     
     - parameter productID: product unique ID
     
     - returns:No Return value
     */
    func collectionViewDidSelect(productID:String,productTitle:String){
        let storyboard = UIStoryboard(name: kMain, bundle: nil)
        let viewController = storyboard.instantiateViewController(
            withIdentifier: kProductPageController)  as! ProductPageController
        viewController.productID = productID
        viewController.productTitle = productTitle
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    // MARK: - Class Function
    
    /**
     This function is used to set data to class data member
     
     - returns:No Return value
     */
    func setupDataSourceAndDelegate(){
        collectionView.dataSource = dataProvider
        collectionView.delegate = dataProvider
        dataProvider.view = self.view
        dataProvider.delegate = self
    }
    
    
    /**
     This function is used to get the product Info from server
     
     - returns:No Return value
     */
    func getProductlist(){
        activityIndicator.startAnimating()
        productInfoManagerObj.getTheProductInfo(strUrl:kBaseUrl+kProductGridAPI) { (arrProductInfo) in
            DispatchQueue.main.async() {
                self.arrProductInfoObj = arrProductInfo
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.dataProvider.arrProductInfoObj = arrProductInfo
                self.collectionView.reloadData()
                self.navigationItem.title = kDishWashers + " ("  + String(arrProductInfo.count) + ")"
            }
        }
    }
}
