//
//  Price.swift
//  DishWasherApp
//
//  Created by Shashank Dekate on 20/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import Foundation

struct Price {
    var was:String?
    var then1:String?
    var then2:String?
    var now:String?
    var uom:String?
    var currency:String?
    
    init(was:String?=nil,then1:String?=nil,then2:String?=nil,now:String?=nil,uom:String?=nil,currency:String?=nil) {
        
        self.was = was
        self.then1 = then1
        self.then2 = then2
        self.now = now
        self.uom = uom
        self.currency = currency
        
    }
    
}
