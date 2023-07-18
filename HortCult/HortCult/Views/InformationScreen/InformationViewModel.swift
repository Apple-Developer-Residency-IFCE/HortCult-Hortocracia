//
//  InformationViewModel.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 06/07/23.
//

import Foundation
import UIKit

class InformationViewModel {
    let service: CoredataServices
    
    init(service: CoredataServices){
        self.service = service
    }
    
    func deletePlant(plantModel: PlantModel){
        service.deletePlantModel(plantModel: plantModel)
        CoreDataStack.shared.saveContext()
    }
    
    func allImagesToUI(images: [Data]) -> [UIImage]{
        var uiImages:[UIImage] = []
        for i in 0..<images.count {
            uiImages.append(UIImage(data: images[i]) ?? UIImage())
        }
        return uiImages
    }

}
