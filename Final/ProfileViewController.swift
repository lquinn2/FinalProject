//
//  ProfileViewController.swift
//  Final
//
//  Created by Student on 2019-04-12.
//  Copyright © 2019 Liam Quinn. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol profileDelegate: class {
    var currentUser: User? { get set }
}

class ProfileViewController: UIViewController {
    weak var delegate: MainViewController?
    
    var user: User?
    
    var managedObjectContext: NSManagedObjectContext!
    var container: NSPersistentContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
    }
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBAction func signOutButton(_ sender: Any) {
        let alert = UIAlertController(title: "Are you sure you want to sign out?", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            self.delegate?.currentUser = nil
            self.delegate?.loginButton.title = "Login"
            self.navigationController?.popViewController(animated: true)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func updateLabels() {
        usernameLabel.text = user?.username
        firstNameLabel.text = user?.firstName
        lastNameLabel.text = user?.lastName
        emailLabel.text = user?.email
        addressLabel.text = user?.address
    }
    
}
