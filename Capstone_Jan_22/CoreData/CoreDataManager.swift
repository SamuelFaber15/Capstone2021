//
//  CoreDataManager.swift
//  Capstone_Jan_22
//
//  Created by Ashleigh Koener on 3/30/21.
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
////    func updateGoal() {
////
////        do {
////            try persistentContainer.viewContext.save()
////        } catch {
////            persistentContainer.viewContext.rollback()
////        }
////    }


    func deleteGoal(goal: Goal) {
        persistentContainer.viewContext.delete(goal)

        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save goal \(error)")
        }
    }

    func getAllGoals() -> [Goal] {

        let fetchRequest: NSFetchRequest<Goal> = Goal.fetchRequest()

        do{
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }

    func saveGoal(name: String) {
        let goal = Goal(context: persistentContainer.viewContext)
        goal.name = name

        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save goal \(error)")
        }
    }

}
