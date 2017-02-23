//
//  ProductPageDataProvider.swift
//  DishWasherApp
//
//  Created by Shashank Dekate on 23/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import UIKit
import Kingfisher


protocol scrollViewScrollEndDelegate {
    func didScrollViewEndScrolling(scrollViewContentOffset:CGFloat)
}

class ProductPageDataProvider: NSObject,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    var imageUrl:[String] = []
    var delegate:scrollViewScrollEndDelegate?

    // MARK: - Collection View DataSource Function
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageUrl.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:kImageColectionView, for: indexPath as IndexPath) as! ProductDetailCollectionCell
        
        if(imageUrl[indexPath.row] != ""){
            
            var str = imageUrl[indexPath.row]
            
            if (str.characters.count) > 2{
                
                let index = str.index((str.startIndex), offsetBy: 2)
                
                //print(str.substring(to: index) )
                
                if str.substring(to: index) == "//"{
                    
                    str = kHttps + str
                    
                    let nsurl = URL(string: str)
                    
                    cell.imageView.kf.setImage(with: nsurl,
                                               placeholder: nil,
                                               options: [.transition(ImageTransition.fade(1))],
                                               progressBlock:nil,
                                               completionHandler:nil)
                }
                
            }
        }
        
        return cell
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        
        delegate?.didScrollViewEndScrolling(scrollViewContentOffset: scrollView.contentOffset.x)
        
    }
    

}
