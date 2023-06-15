//
//  PlantViewModel.swift
//  HortCult
//
//  Created by Pedro Henrique Santos Rodrigues on 14/06/23.
//

import Foundation
import CoreData
import SwiftUI
import Combine
import UIKit
class PlantViewModel: ObservableObject {
    let viewcontext = PersistenceController.shared.container.viewContext
    @Published var plant = [Plant]()
    
    func imageDataConvert(name: String) -> Data? {
        if let image = UIImage(named: name) {
            if let imageData = image.jpegData(compressionQuality: 1.0) {
                return imageData
            } else if let imageData = image.pngData() {
                return imageData
            }
        }
        return nil
    }
    
    
    func fetch() {
        let fetchRequest: NSFetchRequest<Plant> = Plant.fetchRequest()
        guard let fetchPlants = try? viewcontext.fetch(fetchRequest) else {
            return
        }
        
        plant = fetchPlants
    }
    
    func createPlant(name: String, information: String, category: String, frequency: String, image: Data){
        
        let newPlant = Plant(context: viewcontext)
        newPlant.id = UUID()
        newPlant.name = name
        newPlant.information = information
        newPlant.category = category
        newPlant.frequency = frequency
        newPlant.image = image
        
        do {
            try viewcontext.save()
            fetch()
        }catch let error as NSError{
            print("Náo foi possivel salvar \(error) \(error.userInfo)")
        }
    }
    
    func deletePlant(plant: Plant){
        viewcontext.delete(plant)
        do{
            try viewcontext.save()
            fetch()
        }catch let error as NSError{
            print("Náo foi possivel salvar \(error) \(error.userInfo)")
        }
    }
    
    func updatePlant(plant: Plant, name: String, information: String, category: String, frequency: String, image: Data){
        
        plant.id = plant.id
        plant.name = name
        plant.information = information
        plant.category = category
        plant.frequency = frequency
        plant.image = image
        do{
            try viewcontext.save()
            fetch()
        }catch let error as NSError{
            print("Nào foi possivel atualiar \(error) \(error.userInfo)")
        }
    }
}
