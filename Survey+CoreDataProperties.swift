//
//  Survey+CoreDataProperties.swift
//  TabBarConfig
//
//  Created by Swaminarayan on 19/04/23.
//
//

import Foundation
import CoreData


extension Survey {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Survey> {
        return NSFetchRequest<Survey>(entityName: "Survey")
    }

    @NSManaged public var id: String?
    @NSManaged public var progress: Data?

}

extension Survey : Identifiable {

}
