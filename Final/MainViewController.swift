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

