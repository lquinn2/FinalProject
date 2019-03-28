//
//  MetalViewController.swift
//  Final
//
//  Created by Student on 2019-03-27.
//  Copyright © 2019 Liam Quinn. All rights reserved.
//

import UIKit
import Foundation

class SiliconeViewController: UIViewController, productPageDelegate {
    var image: UIImage?
    var name: String?
    var price: Double?
    override func viewDidLoad() {
        image = #imageLiteral(resourceName: "siliconestrawwithbox")
        name = "Silicone Straw"
        price = 9.99
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Product Page" {
            let controller = segue.destination as! ProductPageViewController
            controller.delegate = self
        }
    }
}

