//
//  PageGridDataProvider.swift
//  DishWasherApp
//
//  Created by Zensar Technologies1 on 21/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import UIKit

class PageGridDataProvider: NSObject,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    var arrProductInfoObj: [ProductInfo] = []
    var view :UIView!
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int{
        
        print(arrProductInfoObj.count)
        
        return arrProductInfoObj.count

    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productInfoCell", for: indexPath) as! PageGridCollectionCell
        
        if(arrProductInfoObj[indexPath.row].price?.now != nil){
            cell.price.text = arrProductInfoObj[indexPath.row].price?.now
        }
        
        if(arrProductInfoObj[indexPath.row].title != nil){
            cell.title.text = arrProductInfoObj[indexPath.row].title
        }
        
        
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 1.0
        
        return cell
    
    }
    
    // MARK: - UICollectionViewFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let picDimension = self.view.frame.size.width / 3.0
        return CGSize(width: picDimension, height: 330)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let leftRightInset = self.view.frame.size.width / 14.0
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    

    

}
