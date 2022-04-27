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
    
    // Created Initilizer
    init(){
        persistanceContainer = NSPersistentContainer(name: "Model")
        persistanceContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core data Store is Failed to initiate, \(error.localizedDescription)")
            }
        }
    }
    
    func saveMovie(title: String) {
        
        // Need to created object for Movie Entity
        
        let movie = Movie(context: persistanceContainer.viewContext)
        movie.title = title
        do {
            try persistanceContainer.viewContext.save()
        } catch (let err) {
            print(err.localizedDescription)
        }
    }
    
    func getAllMovies() -> [Movie] {
    
        //get all moview
        // Creata afetch request
        let fetchRequest : NSFetchRequest <Movie> = Movie.fetchRequest()
        
        do {
           return try persistanceContainer.viewContext.fetch(fetchRequest)
        }
        catch {
            return[]
        }
    }
    
    func deleteMoview(movie : Movie) {
        // Delete single movie from moview
        // don't confuse here Movie is a model fo single data of moview which is saved
        persistanceContainer.viewContext.delete(movie)
        do {
            try persistanceContainer.viewContext.save()
        } catch {
            persistanceContainer.viewContext.rollback()
            print("failed to save context, error is  :  \(error.localizedDescription)")
        }
    }
}

