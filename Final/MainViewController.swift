//
//  ViewController.swift
//  Final
//
//  Created by Student on 2019-03-05.
//  Copyright © 2019 Liam Quinn. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController, loginDelegate, profileDelegate {
    var currentUser: User?
    
    var dataCreated: Bool = false
    
    let metalStrawStraight: ItemObject = ItemObject(id: 1, title: "Stainless Steel (Straight Pipe)", price: 9.99)
    let metalStrawBent: ItemObject = ItemObject(id: 2, title: "Stainless Steel (Bent Pipe)", price: 9.99)
    let bambooStraws: ItemObject = ItemObject(id: 3, title: "Bamboo Straws - 20pcs", price: 14.99)
    let glassStraw: ItemObject = ItemObject(id: 4, title: "Glass Straw", price: 5.99)
    let siliconeStraw: ItemObject = ItemObject(id: 5, title: "Silicone Straw (With Box)", price: 11.99)
    let collapsibleStraw: ItemObject = ItemObject(id: 6, title: "Collapsible Straw (With Bin)", price: 19.99)
    let cleaningBrush: ItemObject = ItemObject(id: 7, title: "Cleaning Brush", price: 1.99)
    
    @IBOutlet weak var loginButton: UIBarButtonItem!
    
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
        if dataCreated == false {
            initializeData()
            dataCreated = true
        }
    }
    
    func updateUserData() {
        print(currentUser?.username ?? "nil")
        if let _ = currentUser {
            loginButton.title = currentUser?.username
        }
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
                print ("Failed saving item")
            }
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        newUser.setValue("lquinn", forKey: "username")
        newUser.setValue("password", forKey: "password")
        newUser.setValue("Liam", forKey: "firstName")
        newUser.setValue("Quinn", forKey: "lastName")
        newUser.setValue("lquinn@northislandcollege.ca", forKey: "email")
        newUser.setValue("2054 Tamarack Drive", forKey: "address")
        
        do {
            try context.save()
            print("User saved")
        } catch {
            print ("Failed saving user")
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        if loginButton.title == "Login" {
            performSegue(withIdentifier: "Login", sender: nil)
        } else {
            performSegue(withIdentifier: "Profile", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Login" {
            let controller = segue.destination as! LoginViewController
            controller.delegate = self
            controller.managedObjectContext = managedObjectContext
            controller.container = container
        }
        if segue.identifier == "Profile" {
            let controller = segue.destination as! ProfileViewController
            controller.delegate = self
            controller.managedObjectContext = managedObjectContext
            controller.container = container
            controller.user = currentUser

        }
    }

    @IBOutlet weak var MetalButton: UIButton!
    @IBOutlet weak var BambooButton: UIButton!
    @IBOutlet weak var GlassButton: UIButton!
    @IBOutlet weak var SiliconeButton: UIButton!
    @IBOutlet weak var CollapsibleButton: UIButton!
}

