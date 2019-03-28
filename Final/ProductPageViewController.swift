//
//  ProductPageViewController.swift
//  Final
//
//  Created by Student on 2019-03-27.
//  Copyright © 2019 Liam Quinn. All rights reserved.
//

import Foundation
import UIKit

protocol productPageDelegate: class {
    var image: UIImage? { get set }
    var name: String? { get set }
    var price: Double? { get set }
}

class ProductPageViewController : UIViewController {
    weak var delegate: productPageDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateContent()
        ProductQuantity.text = "1"
        print(delegate?.image! as Any)
        print(delegate?.name! as Any)
        print(delegate?.price! as Any)
    }
    
    @IBOutlet weak var ProductImage: UIImageView!
    @IBOutlet weak var ProductName: UILabel!
    @IBOutlet weak var ProductPrice: UILabel!
    @IBOutlet weak var ProductQuantity: UILabel!
    @IBAction func ProductQuantityStepper(_ sender: UIStepper) {
        ProductQuantity.text = String(Int(sender.value))
    }
    
    
    
    func updateContent() {
        // Default Values
        var unwrappedImage: UIImage = #imageLiteral(resourceName: "plasticstraws")
        var unwrappedName: String = "---"
        var unwrappedPrice: Double = 0.00
        
        // Optional Unwrapping
        if let _ = delegate?.image {
            unwrappedImage = (delegate?.image)!
        }
        if let _ = delegate?.name {
            unwrappedName = (delegate?.name)!
        }
        if let _ = delegate?.price {
            unwrappedPrice = (delegate?.price)!
        }
        
        // Set Values
        ProductImage.image = unwrappedImage
        ProductName.text = unwrappedName
        ProductPrice.text = "$" + String(format:"%.2f", unwrappedPrice)
    }
    
}
