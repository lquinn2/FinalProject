//
//  Item+CoreDataProperties.swift
//  Final
//
//  Created by Student on 2019-04-10.
//  Copyright © 2019 Liam Quinn. All rights reserved.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var id: Int16
    @NSManaged public var title: String
    @NSManaged public var price: Double
    @NSManaged public var relationship: User?

}
