//
//  AddPlantViewModel.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 05/07/23.
//

import Foundation

class AddPlantViewModel: ObservableObject {
    @Published var plantName: String = ""
    @Published var plantInformation: String = ""
    @Published var plantCategory: String = ""
    @Published var plantFrequency: String = ""
    @Published var plantNextDate: Date = Date()
    @Published var plantImage:[Data] = []
    @Published var addButtonIsDisabled: Bool = false
    let service: CoredataServices
    
    init(service: CoredataServices){
        self.service = service
    }
    
    // quando eu tenho uma função assim:
    func validatesFields(name:String) -> Bool{
        if(name.isEmpty) {return false}
        else{ return true }
    }
    
    func addPlant(){
        let _ = service.createPlant(name: plantName, information: plantInformation, category: plantCategory, frequency: plantFrequency, image: plantImage, nextDate: plantNextDate)
        plantName = ""
        plantInformation = ""
        plantCategory = ""
        plantFrequency = ""
        plantImage = []
        plantNextDate = Date()
        CoreDataStack.shared.saveContext()
    }
    
    private func resetFields() {
        plantName = ""
        plantInformation = ""
        plantCategory = ""
        plantFrequency = ""
        plantImage = []
        plantNextDate = Date()
    }
    
}
