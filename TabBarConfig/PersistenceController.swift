//
//  PersistenceController.swift
//  TabBarConfig
//
//  Created by Swaminarayan on 19/04/23.
//

import CoreData

class PersistenceController : ObservableObject{
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "SurveyData")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Container load failed: \(error)")
            }
        }
    }
}
