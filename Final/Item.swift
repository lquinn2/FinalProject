//
//  Item.swift
//  Final
//
//  Created by Student on 2019-04-10.
//  Copyright © 2019 Liam Quinn. All rights reserved.
//

import Foundation

class ItemObject {
    var id: Int
    var title: String
    var price: Double
    
    init(id: Int, title: String, price: Double) {
        self.id = id;
        self.title = title
        self.price = price
    }
}
