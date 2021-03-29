//
//  CoreDataManager.swift
//  Capstone_Jan_22
//
//  Created by Ashleigh Koener on 3/24/21.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer

    init() {
        persistentContainer = NSPersistentContainer(name:"GoalDataModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }


//
////    func updateMovie() {
////
////        do {
////            try persistentContainer.viewContext.save()
////        } catch {
////            persistentContainer.viewContext.rollback()
////        }
////    }


    func deleteMovie(movie: Movie) {
        persistentContainer.viewContext.delete(movie)

        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save comtext \(error)")
        }
    }

    func getAllMovies() -> [Movie] {

        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()

        do{
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }

    func saveMovie(title: String) {
        let movie = Movie(context: persistentContainer.viewContext)
        movie.title = title

        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save movie \(error)")
        }
    }

}
