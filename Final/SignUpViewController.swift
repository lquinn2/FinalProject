//
//  SignUpViewController.swift
//  Final
//
//  Created by Student on 2019-04-10.
//  Copyright © 2019 Liam Quinn. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class SignUpViewController: UIViewController {
    var managedObjectContext: NSManagedObjectContext!
    var username: String?
    var password: String?
    var firstName: String?
    var lastName: String?
    var email: String?
    var address: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        instantiateData()
    }
    
    func instantiateData() {

    }

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    
    @IBAction func signUpButton(_ sender: Any) {
        self.username = usernameField.text!
        self.password = passwordField.text!
        self.firstName = firstNameField.text!
        self.lastName = lastNameField.text!
        self.email = emailField.text!
        self.address = addressField.text!
        
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
        if self.firstName == "" {
            self.firstName = "(nil)"
            allFieldsValidated = false
        }
        if self.lastName == "" {
            self.lastName = "(nil)"
            allFieldsValidated = false
        }
        if !isEmailValid(self.email!) {
            self.email = "(nil)"
            allFieldsValidated = false
        }
        if self.address == "" {
            self.address = "(nil)"
            allFieldsValidated = false
        }
        
        print("------------")
        print(username!)
        print(password!)
        print(firstName!)
        print(lastName!)
        print(email!)
        print(address!)
        print("------------")
        
        if allFieldsValidated {
            signup(username: self.username!, password: self.password!, firstName: self.firstName!, lastName: self.lastName!, email: self.email!, address: self.address!)
        } else {
            print("Invalid values")
            self.present(alert, animated: true)
        }
        
    }
    
    
    func signup(username: String, password: String, firstName: String, lastName: String, email: String, address: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        let alert = UIAlertController(title: "Error making user", message: "Record could not be saved into CoreData", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        
        newUser.setValue(username, forKey: "username")
        newUser.setValue(password, forKey: "password")
        newUser.setValue(firstName, forKey: "firstName")
        newUser.setValue(lastName, forKey: "lastName")
        newUser.setValue(email, forKey: "email")
        newUser.setValue(address, forKey: "address")
        
        do {
            try context.save()
            
            let hudView = HudView.hud(inView: navigationController!.view, animated: true)
            hudView.text = " User Created \n Successfully"
            let delayInSeconds = 0.6
            DispatchQueue.main.asyncAfter(deadline: .now() + delayInSeconds,
                                          execute: {
                                            hudView.hide()
                                            self.navigationController?.popViewController(animated: true)
            })
        } catch {
            print ("Failed saving")
            self.present(alert, animated: true)
        }
    }
    
    func isEmailValid(_ value: String) -> Bool {
        do {
            if try NSRegularExpression(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                return false
            }
        } catch {
            return false
        }
        return true
    }
}

