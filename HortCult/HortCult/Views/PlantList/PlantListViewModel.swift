//
//  PlantListViewModel.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 05/07/23.
//

import Foundation

class PlantListViewModel: ObservableObject {
    let service: CoredataServices
    @Published var plants: [Plant] = []
    
    init(service: CoredataServices){
        self.service = service
        loadPlants()
    }
    
    func loadPlants(){
        self.plants = service.fetchPlant()
    }
}
