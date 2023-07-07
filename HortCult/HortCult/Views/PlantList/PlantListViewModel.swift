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
    @Published var plants: [Plant] = []
    
    init(service: CoredataServices){
        self.service = service
        loadPlants()
    }
    
    func loadPlants(){
        self.plants = service.fetchPlant()
    }
    
    func dataToUIImage(planta: Plant) -> UIImage{
        if let dataImage = planta.image?.first {
            return UIImage(data: dataImage) ?? UIImage()
        } else {
            return UIImage()
        }
    }
}
