//
//  AddPlantViewModel.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 05/07/23.
//

import Foundation

class AddPlantViewModel: ObservableObject {
    @Published var plantName: String = ""{
        didSet {
            validatesFields()
        }
    }
    
    @Published var plantInformation: String = "" {
        didSet {
            validatesFields()
        }
    }
    
    @Published var plantCategory: String = ""{
        didSet {
            validatesFields()
        }
    }
    
    @Published var plantFrequency: String = ""{
        didSet {
            validatesFields()
        }
    }
    
    @Published var plantNextDate: Date = Date()
    @Published var plantImage:[Data] = []
    @Published var selectedPhotosData:[Data] = []
    
    @Published var isAddButtonAble: Bool = false
    
    let service: CoredataServices
    
    init(service: CoredataServices){
        self.service = service
    }
    
    func validatesFields() {
        isAddButtonAble = !plantName.isEmpty && !plantCategory.isEmpty && !plantFrequency.isEmpty && !plantInformation.isEmpty
    }
    
    func addPlant(){
        let _ = service.createPlant(name: plantName, information: plantInformation, category: plantCategory, frequency: plantFrequency, image: plantImage, nextDate: plantNextDate)
        CoreDataStack.shared.saveContext()
        resetFields()
        
    }
    
    func resetFields() {
        plantName = ""
        plantInformation = ""
        plantCategory = ""
        plantFrequency = ""
        plantImage = []
        plantNextDate = Date()
    }
    
}
