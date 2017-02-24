//
//  PageGridDataProvider.swift
//  DishWasherApp
//
//  Created by Zensar Technologies1 on 21/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import UIKit
import Kingfisher

protocol collectionViewActionDelegate {
    func collectionViewDidSelect(productID:String,productTitle:String)
}

class PageGridDataProvider: NSObject,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    // MARK: - Global Data Variable
    var arrProductInfoObj: [ProductInfo] = [] // array contain product info object
    var view :UIView! // used for Containing View
    var delegate:collectionViewActionDelegate?
    
    
    // MARK: - UICollectionDataSource
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int{
        return arrProductInfoObj.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:kProduct_InfoCell, for: indexPath) as! PageGridCollectionCell
        
        if(arrProductInfoObj[indexPath.row].price?.now != nil){
            cell.priceLbl.text = "£" + (arrProductInfoObj[indexPath.row].price?.now)!
        }
        
        if(arrProductInfoObj[indexPath.row].title != nil){
            cell.titleLbl.text = arrProductInfoObj[indexPath.row].title
        }
        
        if(arrProductInfoObj[indexPath.row].imageUrl != nil){
            var str = arrProductInfoObj[indexPath.row].imageUrl
            if (str?.characters.count)! > 2{
                let index = str?.index((str?.startIndex)!, offsetBy: 2)
                if str?.substring(to: index!) == "//"{
                    str = kHttps + str!
                    let nsurl = URL(string: str!)
                    cell.imageView.kf.setImage(with: nsurl,
                                               placeholder: nil,
                                               options: [.transition(ImageTransition.fade(1))],
                                               progressBlock:nil,
                                               completionHandler:nil)
                }
            }
        }
        
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 1.0
        return cell
        
    }
    
    // MARK: - UICollectionDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.collectionViewDidSelect(productID: arrProductInfoObj[indexPath.item].productId!,productTitle:arrProductInfoObj[indexPath.item].title! )
    }
    
    // MARK: - UICollectionViewFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let picDimension = self.view.frame.size.width / 3.0
        return CGSize(width: picDimension, height: 330)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        _ = self.view.frame.size.width / 14.0
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    
    
    
}
