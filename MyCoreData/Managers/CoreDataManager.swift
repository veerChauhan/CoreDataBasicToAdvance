//
//  File.swift
//  MyCoreData
//
//  Created by Ravi Ranjan on 28/04/22.
//

import Foundation
import CoreData
class CoreDataManager {
    
    let persistanceContainer : NSPersistentContainer
    init(){
        persistanceContainer = NSPersistentContainer(name: "Model")
        persistanceContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core data Store is Failed to initiate, \(error.localizedDescription)")
            }
        }
    }
}

