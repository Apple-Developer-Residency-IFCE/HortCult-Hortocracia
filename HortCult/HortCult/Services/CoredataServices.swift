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
                image: [Data],
                nextDate: Date) {
        plant.name = name
        plant.information = information
        plant.frequency = frequency
        plant.category = category
        plant.nextDate = nextDate
        plant.image = image
        CoreDataStack.shared.saveContext()
    }
    
    func update(plant:Plant, nextDate:Date){
        plant.nextDate = nextDate
        CoreDataStack.shared.saveContext()
    }
    
    func updatePlantModel(plantModel: PlantModel,
                          name: String,
                          information: String,
                          category: String,
                          frequency: String,
                          image: [Data],
                          nextDate: Date) {
        let plant = fetchPlant(by: plantModel.id)
        update(plant: plant,
               name: name,
               information: information,
               category: category,
               frequency: frequency,
               image: image,
               nextDate: nextDate)
    }
    func updatePlantModel(plantModel:PlantModel,nextDate:Date){
        let plant = fetchPlant(by: plantModel.id)
        update(plant: plant, nextDate: nextDate)
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
    
    func fetchPlant(by id: UUID) -> Plant {
        let plants = fetchPlant()
        let plant = plants.filter({
            $0.id == id
        })
        return plant.first!
    }
    
    func fetchPlantModel() -> [PlantModel] {
        let plantsClass = fetchPlant()
        var plants: [PlantModel] = []
        plantsClass.forEach {
            plants.append(convertToPlantModel(plant: $0)!)
        }
        return plants
    }
    
    func fetchPlantModel(by id:UUID) -> PlantModel {
        let plants = fetchPlantModel()
        let plant = plants.filter({
            $0.id == id
        })
        return plant.first!
    }
    
    func convertToPlantModel(plant: Plant) -> PlantModel? {
        guard let id = plant.id,
              let name = plant.name,
              let category = plant.category,
              let information = plant.information,
              let frequency = plant.frequency,
              let nextDate = plant.nextDate
        else{
            return nil
        }
        let image = plant.image ?? []
        return PlantModel(id: id, name: name, category: category, information: information, frequency: frequency, image: image, nextDate: nextDate)
    }
    
    func deletePlantModel(plantModel: PlantModel){
        let plant = fetchPlant(by: plantModel.id)
        delete(plant: plant)
    }
    
}
