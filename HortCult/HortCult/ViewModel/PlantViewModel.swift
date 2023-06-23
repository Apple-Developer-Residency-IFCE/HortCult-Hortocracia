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
    
    func imageDataConvert(image: UIImage) -> Data? {
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            return imageData
        } else if let imageData = image.pngData() {
            return imageData
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
    
    func createPlant(name: String, information: String, category: String, frequency: String, image: UIImage){
        
        let newPlant = Plant(context: viewcontext)
        newPlant.id = UUID()
        newPlant.name = name
        newPlant.information = information
        newPlant.category = category
        newPlant.frequency = frequency
        newPlant.image = imageDataConvert(image: image)
        newPlant.nextDate = Date()
        
        do {
            try viewcontext.save()
            fetch()
            print("criou a planta \(name)")
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
    
    func updatePlant(plant: Plant, name: String, information: String, category: String, frequency: String, nextDate: Date, image: Data){
        
        plant.id = plant.id
        plant.name = name
        plant.information = information
        plant.category = category
        plant.frequency = frequency
        plant.nextDate = nextDate
        plant.image = image
        do{
            try viewcontext.save()
            fetch()
        }catch let error as NSError{
            print("Nào foi possivel atualiar \(error) \(error.userInfo)")
        }
    }
    
    func filterPlant() -> [Plant] {
        
        var plantsArray = [Plant]()
        var formatedToday: Date? = Date()
        let formatter = DateFormatter()
        let auxString = String(formatedToday!.formatted().prefix(9))
        formatter.dateFormat = "MM/dd/yyyy"
        formatedToday = formatter.date(from: auxString)
        
        for planta in plant{
            var plantaDate: Date? = planta.nextDate
            var plantaDateString = String(plantaDate!.formatted().prefix(9))
            plantaDate = formatter.date(from: plantaDateString)
            if(plantaDate ?? Date() <= formatedToday ?? Date()){
                plantsArray.append(planta)
            }
        }
    
        return plantsArray
    }
    
//

}
