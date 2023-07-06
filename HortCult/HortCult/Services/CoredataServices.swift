//
//  CoredataServices.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 05/07/23.
//

import Foundation
import CoreData
import UIKit

class CoreDataStack {
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataStack()

    private init() {
        persistentContainer = NSPersistentContainer(name: "HortCult")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                print("Created")
                try context.save()
            } catch {
                print("Not Created")
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

class CoredataServices {
    func createPlant(name: String,
                     information: String,
                     category: String,
                     frequency: String,
                     image: [Data],
                     nextDate: Date) {
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let plant = Plant(context: context)
        plant.id = UUID()
        plant.name = name
        plant.information = information
        plant.frequency = frequency
        plant.category = category
        plant.image = image
        plant.nextDate = nextDate
        CoreDataStack.shared.saveContext()
    }
    
    func delete(plant: Plant) {
        let context = CoreDataStack.shared.persistentContainer.viewContext
        context.delete(plant)
    }
    
    func update(plant: Plant,
                name: String,
                information: String,
                category: String,
                frequency: String,
                image: [UIImage],
                nextDate: Date) {
        plant.name = name
        plant.information = information
        plant.frequency = frequency
        plant.category = category
        plant.nextDate = nextDate
        CoreDataStack.shared.saveContext()
    }
    
    func fetchPlant() -> [Plant] {
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Plant> = Plant.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
}
