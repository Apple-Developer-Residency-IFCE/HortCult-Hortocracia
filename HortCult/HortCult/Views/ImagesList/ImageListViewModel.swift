//
//  ImageListViewModel.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 19/07/23.
//

import Foundation

class ImageListViewModel: ObservableObject {
    @Published var planta:PlantModel
    @Published var data:[Data]
    let service:CoredataServices
    
    init(service:CoredataServices, planta:PlantModel){
        self.service = service
        self.planta = planta
        data = planta.image
    }
    
    func getImage(){
        data = service.fetchPlantModel(by: planta.id).image
    }
}
