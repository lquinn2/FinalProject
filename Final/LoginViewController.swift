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

protocol loginDelegate: class {
    var currentUser: User? { get set }
}

class LoginViewController: UIViewController {
    var managedObjectContext: NSManagedObjectContext!
    var container: NSPersistentContainer!
    
    var username: String?
    var password: String?
    
    weak var delegate: MainViewController?
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        self.username = usernameField.text!
        self.password = passwordField.text!
        
        let alert = UIAlertController(title: "Invalid Inputs", message: "Please fill in all form fields correctly", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        
        var allFieldsValidated: Bool = true
        
        if self.username == "" {
            self.username = "(nil)"
            allFieldsValidated = false
        }
        
        if self.password == "" {
            self.password = "(nil)"
            allFieldsValidated = false
        }
    
        if allFieldsValidated == true {
            login(username: self.username!, password: self.password!)
        } else {
            self.present(alert, animated: true)
        }
    }
    
    func login(username: String, password: String) {
        print(username)
        print(password)
        
        let fetchErrorAlert = UIAlertController(title: "Unable to retrieve data", message: "Please try again", preferredStyle: .alert)
        fetchErrorAlert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        
        let loginErrorAlert = UIAlertController(title: "Unsuccessful login", message: "There are no users that match those credentials", preferredStyle: .alert)
        loginErrorAlert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        
        var users: [User]
        
        let fetchRequest = NSFetchRequest<User>()
        
        let entity = User.entity()
        fetchRequest.entity = entity
        
        let sortDescriptor = NSSortDescriptor(key: "username", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]

        do {
            users = try managedObjectContext.fetch(fetchRequest)
            print("USERS: " + String(users.count))
            var loggedIn: Bool = false
            for user in users {
                if username == user.username && password == user.password {
                    delegate?.currentUser = user
                    delegate?.updateUserData()
                    loggedIn = true
                    
                    let hudView = HudView.hud(inView: navigationController!.view, animated: true)
                    let delayInSeconds = 0.6
                    DispatchQueue.main.asyncAfter(deadline: .now() + delayInSeconds,
                                                  execute: {
                        hudView.hide()
                        self.navigationController?.popViewController(animated: true)
                    })
                }
            }
            if loggedIn == false {
                self.present(loginErrorAlert, animated: true)
            }
        } catch {
            self.present(fetchErrorAlert, animated: true)
        }
    }
}
