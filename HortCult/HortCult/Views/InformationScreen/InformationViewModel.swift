//
//  InformationViewModel.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 06/07/23.
//

import Foundation
import UIKit

class InformationViewModel : ObservableObject{
    @Published var planta:PlantModel
    
    let service: CoredataServices
    
    init(service: CoredataServices,planta: PlantModel){
        self.planta = planta
        self.service = service
    }
    
    func deletePlant(plantModel: PlantModel){
        service.deletePlantModel(plantModel: plantModel)
        CoreDataStack.shared.saveContext()
    }

}
