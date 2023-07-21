//
//  CoreDataManager.swift
//  Davar
//
//  Created by José Tapadas Alves on 26/06/2023.
//

import Foundation
import CoreData

// this class is a singleton that will enable us to share the access
// to the core data container
class CoreDataManager {
    static let instance = CoreDataManager()
    
    // container that encapsulates the core data stack
    let container: NSPersistentContainer
    
    // object space to manage and track changes to a managed object
    let context: NSManagedObjectContext
    
    // initializes the singleton
    init() {
        container = NSPersistentContainer(name: "DavarCoreContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("[!] Error loading CoreData: \(error)")
            }
        }

        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
            print("[+] Saved entry into CoreData!")
        } catch let error {
            print("[!] Error saving CoreData: \(error.localizedDescription)")
        }
    }
}
