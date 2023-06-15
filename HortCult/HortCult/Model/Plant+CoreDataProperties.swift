//
//  Plant+CoreDataProperties.swift
//  HortCult
//
//  Created by Pedro Henrique Santos Rodrigues on 14/06/23.
//
//

import Foundation
import CoreData


extension Plant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Plant> {
        return NSFetchRequest<Plant>(entityName: "Plant")
    }

    @NSManaged public var name: String?
    @NSManaged public var information: String?
    @NSManaged public var category: String?
    @NSManaged public var frequency: String?
    @NSManaged public var image: Data?
    @NSManaged public var id: UUID?

}

extension Plant : Identifiable {

}