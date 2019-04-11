//
//  ViewController.swift
//  Final
//
//  Created by Student on 2019-03-05.
//  Copyright © 2019 Liam Quinn. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    let metalStrawStraight: ItemObject = ItemObject(id: 1, title: "Stainless Steel (Straight Pipe)", price: 9.99)
    let metalStrawBent: ItemObject = ItemObject(id: 2, title: "Stainless Steel (Bent Pipe)", price: 9.99)
    let bambooStraws: ItemObject = ItemObject(id: 3, title: "Bamboo Straws - 20pcs", price: 14.99)
    let glassStraw: ItemObject = ItemObject(id: 4, title: "Glass Straw", price: 5.99)
    let siliconeStraw: ItemObject = ItemObject(id: 5, title: "Silicone Straw (With Box)", price: 11.99)
    let collapsibleStraw: ItemObject = ItemObject(id: 6, title: "Collapsible Straw (With Bin)", price: 19.99)
    let cleaningBrush: ItemObject = ItemObject(id: 7, title: "Cleaning Brush", price: 1.99)
    
    var managedObjectContext: NSManagedObjectContext!
    var container: NSPersistentContainer!
    
    let applicationDocumentsDirectory: URL = {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(applicationDocumentsDirectory)
        
        ////---- ONLY RUN THIS ONCE: To initially create the items ----////
        //initializeData()
    }
    
    func initializeData(){
        
        
        let items: [ItemObject] = [
            metalStrawStraight,
            metalStrawBent,
            bambooStraws,
            glassStraw,
            siliconeStraw,
            collapsibleStraw,
            cleaningBrush
        ]
        
        for item in items {
            let itemId = item.id
            let title = item.title
            let price = item.price
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Item", in: context)
            let newItem = NSManagedObject(entity: entity!, insertInto: context)
            
            newItem.setValue(itemId, forKey: "id")
            newItem.setValue(title, forKey: "title")
            newItem.setValue(price, forKey: "price")
            
            do {
                try context.save()
                print("Item " + title + " saved")
            } catch {
                print ("Failed saving")
            }
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Login" {
            let controller = segue.destination as! LoginViewController
            controller.managedObjectContext = managedObjectContext
        }
    }

    @IBOutlet weak var MetalButton: UIButton!
    @IBOutlet weak var BambooButton: UIButton!
    @IBOutlet weak var GlassButton: UIButton!
    @IBOutlet weak var SiliconeButton: UIButton!
    @IBOutlet weak var CollapsibleButton: UIButton!
}

