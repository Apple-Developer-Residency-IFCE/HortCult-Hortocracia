//
//  ListReminderViewModel.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 20/07/23.
//

import Foundation

class ListReminderViewModel:ObservableObject {
    @Published var plantas:[PlantModel]
    let service:CoredataServices
    
    init(service:CoredataServices){
        self.service = service
        plantas = service.fetchPlantModelByDate()
    }
    
    func getPlants() -> [PlantModel]{
        plantas = service.fetchPlantModelByDate()
        return plantas
    }

}
