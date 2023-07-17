//
//  EditPlantViewModel.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 05/07/23.
//

import Foundation

class EditPlantViewModel: ObservableObject {
    @Published var planta:Plant
    @Published var plantName: String
    @Published var plantInformation: String
    @Published var plantCategory: String
    @Published var plantFrequency: String
    @Published var plantNextDate: Date
    @Published var plantImage:[Data]
    @Published var isEditButtonAble: Bool = true
    @Published var selectedPhotosData:[Data] = []
    
    let service: CoredataServices
    
    init(service: CoredataServices, planta: Plant){
        self.planta = planta
        self.service = service
        plantName = planta.name ?? ""
        plantInformation = planta.information ?? ""
        plantCategory = planta.category ?? ""
        plantFrequency = planta.frequency ?? ""
        plantNextDate = planta.nextDate ?? Date()
        plantImage = planta.image ?? []
    }
    
    
    func validatesFields() {
        isEditButtonAble = !plantName.isEmpty && !plantCategory.isEmpty && !plantFrequency.isEmpty && !plantInformation.isEmpty
    }
    
    
    func updatePlant(){
        let _ = service.update(plant: planta,
                               name: plantName,
                               information: plantInformation,
                               category: plantCategory,
                               frequency: plantFrequency,
                               image: plantImage,
                               nextDate: plantNextDate)
        CoreDataStack.shared.saveContext()
    }
}
