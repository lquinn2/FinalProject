//
//  Login.swift
//  Final
//
//  Created by Student on 2019-04-03.
//  Copyright © 2019 Liam Quinn. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class LoginViewController: UIViewController {
    var managedObjectContext: NSManagedObjectContext!
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instantiateData()
    }
    
    func instantiateData() {
        
    }
    
    func login() {
        
    }
}
