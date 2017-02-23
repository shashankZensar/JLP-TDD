//
//  NetWorkManager.swift
//  DishWasherApp
//
//  Created by Shashank Dekate on 21/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import UIKit

protocol SessionProtocol {
    
    func dataTask(
        with url: URL,
        completionHandler: @escaping
        (Data?, URLResponse?, Error?) -> Void)
        -> URLSessionDataTask
}

enum WebserviceError : Error {
    case DataEmptyError
}

class NetWorkManager {
    
    // MARK: - Global Data Variable
    lazy var session: SessionProtocol = URLSession.shared
    
    
    // MARK: - Custom Function

    /**
     This function get data from Server using Nsurl Session.
     
     - parameter strUrl: Url String contain Server API
     
     - parameter completion: completion handler which give Dictionary After Server Response
     
     - returns: No Return Value
     
     */
    func getDataFromServer(strUrl:String,completion: @escaping (Dictionary<String,AnyObject>?, Error?) -> Void){
        
        guard let url = URL(string:strUrl) else {
            fatalError()
        }
        
        session.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                completion(nil, error);
                return
            }
            
            
            guard let data = data else {
                completion(nil, WebserviceError.DataEmptyError)
                return
            }
            
            do {
                let dict = try JSONSerialization.jsonObject(
                    with: data,
                options: []) as! [String:AnyObject]
                
                completion(dict, nil)
            } catch {
                completion(nil, error)
            }
            
            
            }.resume()
        
    }
    
}

extension URLSession: SessionProtocol {
    
}
