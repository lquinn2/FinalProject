//
//  PersistentContainer.swift
//  Final
//
//  Created by Student on 2019-04-03.
//  Copyright © 2019 Liam Quinn. All rights reserved.
//

import Foundation
import CoreData

class PersistentContainer: NSPersistentContainer {
    
    func saveContext(backgroundContext: NSManagedObjectContext? = nil) {
        let context = backgroundContext ?? viewContext
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch let error as NSError {
            print("Error: \(error), \(error.userInfo)")
        }
    }
}
