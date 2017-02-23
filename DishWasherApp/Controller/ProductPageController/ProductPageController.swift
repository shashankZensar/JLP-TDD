//
//  ProductPageController.swift
//  DishWasherApp
//
//  Created by Zensar Technologies1 on 22/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import UIKit
import Kingfisher

class ProductPageController: UIViewController,scrollViewScrollEndDelegate{
    
    @IBOutlet weak var scrollView: UIScrollView!
    // MARK: - IBOulet
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var displayOfferLbl: UILabel!
    @IBOutlet weak var includeServiceLbl: UILabel!
    @IBOutlet weak var productInformationLbl: UILabel!
    @IBOutlet weak var productCodeLbl: UILabel!
    @IBOutlet weak var productInformationDataLbl: UILabel!
    @IBOutlet weak var productSpecificationLbl: UILabel!
    @IBOutlet weak var productSpecificationNameLbl: UILabel!
    @IBOutlet weak var productSpecificationValueLbl: UILabel!
    @IBOutlet weak var pageCtrl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var dataProvider:ProductPageDataProvider! // DataSource and Delegate Object for collection View
    @IBOutlet weak var viewRightContainer: UIView!
    @IBOutlet weak var viewProductSub: UIView!
    @IBOutlet weak var viewProductMain: UIView!
    @IBOutlet weak var viewGallery: UIView!
    @IBOutlet weak var productMainView: UIView!
    @IBOutlet weak var scrollViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewRightContainerWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewProductSubTopConstaraint: NSLayoutConstraint!
    @IBOutlet weak var mainView: UIView!

    
    // MARK: - Global Data Variable
    var productDetailInfoManagerObj = ProductDetailInfoManager()
    var imageUrl:[String] = []
    var productID:String = ""
    
    
    
    // MARK: - ViewController Function
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDataSourceAndDelegate()
        self.getProductDetail()
    }
    
    /**
     This function is used to set data to class data member
     - returns:No Return value
     */
    func setupDataSourceAndDelegate(){
        
        collectionView.dataSource = dataProvider
        collectionView.delegate = dataProvider
        dataProvider.delegate = self
    }
    
    /**
     This function is used to get the product Data from server
     
     - returns:No Return value
     */
    func getProductDetail(){
        
        activityIndicator.startAnimating()
        productDetailInfoManagerObj.getTheProductDetailInfo(productID:productID) { (productDetailInfo) in
            DispatchQueue.main.async() {
                //self.view.isHidden = false
                self.assignProductDetailToLabel(productDetailinfo: productDetailInfo)
                self.self.dataProvider.imageUrl = productDetailInfo.imageUrl!
                self.collectionView.reloadData()
                self.view.isHidden = false
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                
            }
            
        }
        
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        setFrameAccordingToOrientation()

    }
    
    func setFrameAccordingToOrientation()  {
        var viewWidth = self.view.frame.size.width;
        self.view.setNeedsLayout()
        
        if UIDevice.current.orientation.isLandscape {
            viewWidth = 1024
            scrollViewWidthConstraint.constant = viewWidth * 0.6
            viewRightContainerWidthConstraint.constant = viewWidth * 0.4
            viewProductSubTopConstaraint.constant = 0
            let frame = CGRect(x: 0, y: 0, width: viewWidth * 0.4, height: 158)
            viewProductMain.removeFromSuperview()
            viewProductMain.frame = frame
            viewRightContainer.addSubview(viewProductMain)
            
        }else{
            viewWidth = 768
            scrollViewWidthConstraint.constant = viewWidth
            viewRightContainerWidthConstraint.constant = 0
            viewProductSubTopConstaraint.constant = 158
            let frame = CGRect(x: 0, y: 307, width: viewWidth , height: 158)
            viewProductMain.removeFromSuperview()
            viewProductMain.frame = frame
            scrollView.addSubview(viewProductMain)
            
        }
        self.view.setNeedsUpdateConstraints()
    }
    func preparePriceViewForWidth(_ width: CGFloat) -> CGFloat {
        var height = 0
        //
        return CGFloat(height)
    }
    
    // MARK: - class Function
    
    /**
     This function will assign data to view labels.
     
     - parameter productDetailinfo: product detail object

     - returns: No Return Value
     
     */
    func assignProductDetailToLabel(productDetailinfo:ProductDetailInfo){
        
        self.priceLbl.text = "£" + productDetailinfo.price!
        self.displayOfferLbl.text = productDetailinfo.displaySpecialOffer
        self.includeServiceLbl.text = productDetailinfo.includedServices
        let attributedString = try? NSAttributedString(data: (productDetailinfo.productInformation?.data(using: String.Encoding.unicode)!)!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
        self.productInformationDataLbl.text = "Product Code :" + productDetailinfo.code!
        self.productInformationLbl.text = kProductInformationLbl
        self.productSpecificationLbl.text = kProductSpecificationLbl
        self.productCodeLbl.attributedText = attributedString
        self.productSpecificationNameLbl.text = productDetailinfo.productSpecificationName
        self.productSpecificationValueLbl.text = productDetailinfo.valueOfProductSpecification
        self.imageUrl = productDetailinfo.imageUrl!
        self.pageCtrl.numberOfPages = self.imageUrl.count
        
    }
    
    
    // MARK: - Custom Delegate
    
    /**
      scrollViewScrollEndDelegate function will called when collection View scrolling end.
     
     - parameter scrollViewContentOffset: scrollview offset
     
     - returns: No Return Value
     
     */
    func didScrollViewEndScrolling(scrollViewContentOffset:CGFloat){
        
        let currentPage  = scrollViewContentOffset/self.collectionView.frame.size.width
        pageCtrl.currentPage = Int(currentPage)
    
    }
}
