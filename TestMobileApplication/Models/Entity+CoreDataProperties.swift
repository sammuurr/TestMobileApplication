//
//  Entity+CoreDataProperties.swift
//  TestMobileApplication
//
//  Created by ADMIMN on 23.05.2021.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var birthDate: Date?
    @NSManaged public var codeDevision_1: String?
    @NSManaged public var codeDevision_2: String?
    @NSManaged public var dateOfIssue: Date?
    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var login: String?
    @NSManaged public var lssuedByFrom: String?
    @NSManaged public var pasportSeries: String?
    @NSManaged public var password: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var pollicyNumber: String?
    @NSManaged public var middleName: String?

}

extension Entity : Identifiable {

}
