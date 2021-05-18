//
//  Entity+CoreDataProperties.swift
//  TestMobileApplication
//
//  Created by ADMIMN on 18.05.2021.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var login: String?
    @NSManaged public var password: String?
    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var birthDate: String?
    @NSManaged public var pollicyNumber: String?

}

extension Entity : Identifiable {

}
