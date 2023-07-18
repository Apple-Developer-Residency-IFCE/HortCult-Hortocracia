//
//  PlantListViewModel.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 05/07/23.
//

import Foundation
import UIKit
import SwiftUI

class PlantListViewModel: ObservableObject {
    let service: CoredataServices
    @Published var plantsModel: [PlantModel] = []
    
    init(service: CoredataServices){
        self.service = service
        loadPlants()
    }
    
    func loadPlants(){
        self.plantsModel = service.fetchPlantModel()
    }
    
    func dataToUIImage(planta: PlantModel) -> UIImage{
        if let dataImage = planta.image.first {
            return UIImage(data: dataImage) ?? UIImage()
        } else {
            return UIImage()
        }
    }
}
