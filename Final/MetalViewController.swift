//
//  MetalViewController.swift
//  Final
//
//  Created by Student on 2019-03-27.
//  Copyright © 2019 Liam Quinn. All rights reserved.
//

import UIKit
import Foundation

class MetalViewController: UITableViewController, productPageDelegate {
    var image: UIImage?
    var name: String?
    var price: Double?
    var products: [Straw] =
        [Straw(image: #imageLiteral(resourceName: "metalstraight"), name: "Stainless Steel - Straight pipe", price: 9.99),
         Straw(image: #imageLiteral(resourceName: "metalbent"), name: "Stainless Steel - Bent Pipe", price: 9.99)]
    
    override func viewDidLoad() {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Product Page" {
            let controller = segue.destination as! ProductPageViewController
            controller.delegate = self
        }
    }
    
    // Set Number of Cells
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 2 }
    
    // Set Cell Content
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let cellName = cell.viewWithTag(2) as! UILabel
        let cellPrice = cell.viewWithTag(3) as! UILabel
        
        if indexPath.row ==  0 {
            cell.imageView?.image = products[0].image
            cellName.text = products[0].name
            cellPrice.text = "$" + String(products[0].price)
        } else if indexPath.row == 1 {
            cell.imageView?.image = products[1].image
            cellName.text = products[1].name
            cellPrice.text = "$" + String(products[1].price)
        }
        return cell
    }
    
    // Set Cell Actions
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            // Sets variables
            image = (cell.imageView?.image)! as UIImage
            name = (cell.viewWithTag(2) as! UILabel).text
            // Removes $ from start of string to it can be converted into Double
            var priceString = ((cell.viewWithTag(3) as! UILabel).text)!
            priceString.remove(at: priceString.startIndex)
            price = Double(priceString)
            
            // Open Product Page
            performSegue(withIdentifier: "Product Page", sender: nil)
        }
    }
}
