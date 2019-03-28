//
//  Straw.swift
//  Final
//
//  Created by Student on 2019-03-27.
//  Copyright © 2019 Liam Quinn. All rights reserved.
//

import Foundation
import UIKit

public class Straw {
    var image: UIImage
    var name: String
    var price: Double
    
    init(image: UIImage, name: String, price: Double) {
        self.image = image
        self.name = name
        self.price = price
    }
}
