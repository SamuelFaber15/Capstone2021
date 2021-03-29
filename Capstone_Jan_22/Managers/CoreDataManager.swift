////
////  CoreDataManager.swift
////  Capstone_Jan_22
////
////  Created by Ashleigh Koener on 3/24/21.
////
//
//import Foundation
//import CoreData
//
//class CoreDataManager {
//    let persistentContainer: NSPersistentContainer
//
//    init() {
//        persistentContainer = NSPersistentContainer(name:"Todo_App")
//        persistentContainer.loadPersistentStores { (description, error) in
//            if let error = error {
//                fatalError("Core Data Store failed \(error.localizedDescription)")
//            }
//        }
//    }
//
////    func saveMovie() -> <#return type#> {
////        <#function body#>
////    }
//}
