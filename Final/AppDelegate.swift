//
//  AppDelegate.swift
//  Final
//
//  Created by Student on 2019-03-05.
//  Copyright © 2019 Liam Quinn. All rights reserved.
//

import UIKit
import CoreData
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "UserModel")
        container.loadPersistentStores(completionHandler: {
            storeDescription, error in
            if let error = error {
                fatalError("Could load data store: \(error)")
            }
        })
        return container
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = self.persistentContainer.viewContext

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if let rootVC = window?.rootViewController as? UINavigationController {
            let rootVCControllers = rootVC.viewControllers
            let mainViewController = rootVCControllers.first as! MainViewController
            
            mainViewController.container = persistentContainer
            mainViewController.managedObjectContext = managedObjectContext
            
//            let loginViewController = rootVCControllers.first as! LoginViewController
//            
//            loginViewController.container = persistentContainer
//            loginViewController.managedObjectContext = managedObjectContext
            
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}





//    if let tabViewControllers = tabController.viewControllers {
//        let navController = tabViewControllers[0]
//            as! UINavigationController
//        let controller = navController.viewControllers.first
//            as! CurrentLocationViewController
//        controller.managedObjectContext = managedObjectContext
//    }
//    return true
//}
//
//if let tabViewControllers = tabController.viewControllers {
//    // First tab
//    var navController = tabViewControllers[0]
//        as! UINavigationController
//    let controller1 = navController.viewControllers.first
//        as! CurrentLocationViewController
//    controller1.managedObjectContext = managedObjectContext
//    // Second tab
//    navController = tabViewControllers[1]
//        as! UINavigationController
//    let controller2 = navController.viewControllers.first
//        as! LocationsViewController
//    controller2.managedObjectContext = managedObjectContext
//}

