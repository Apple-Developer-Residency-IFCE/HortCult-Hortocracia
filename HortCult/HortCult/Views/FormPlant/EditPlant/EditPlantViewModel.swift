//
//  EditPlantViewModel.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 05/07/23.
//

import Foundation

class EditPlantViewModel: ObservableObject {
    @Published var planta:PlantModel
    @Published var plantName: String
    @Published var plantInformation: String
    @Published var plantCategory: String
    @Published var plantFrequency: String
    @Published var plantNextDate: Date
    @Published var plantImage:[Data]
    @Published var isEditButtonAble: Bool = true
    @Published var selectedPhotosData:[Data] = []
    
    let service: CoredataServices
    
    init(service: CoredataServices, planta: PlantModel){
        self.planta = planta
        self.service = service
        plantName = planta.name
        plantInformation = planta.information
        plantCategory = planta.category
        plantFrequency = planta.frequency
        plantNextDate = planta.nextDate
        plantImage = planta.image
    }
    
    
    func validatesFields() {
        isEditButtonAble = plantName.isEmpty && plantCategory.isEmpty && plantFrequency.isEmpty && plantInformation.isEmpty
    }
    
    
    func updatePlant(){
        
        planta.name = plantName
        planta.information = plantInformation
        planta.category = plantCategory
        planta.frequency = plantFrequency
        planta.nextDate = plantNextDate
        planta.image = plantImage
        
        let _ = service.updatePlantModel(plantModel: planta,
                               name: plantName,
                               information: plantInformation,
                               category: plantCategory,
                               frequency: plantFrequency,
                               image: plantImage,
                               nextDate: plantNextDate)
        CoreDataStack.shared.saveContext()
    }
}
