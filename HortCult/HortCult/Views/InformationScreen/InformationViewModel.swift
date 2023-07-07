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
    
    func deletePlant(planta: Plant){
        service.delete(plant: planta)
        CoreDataStack.shared.saveContext()
    }
    
    func allImagesToUI(planta: Plant) -> [UIImage]{
        if let datasImage = planta.image {
            var uiImages:[UIImage] = []
            for i in 0..<datasImage.count {
                uiImages.append(UIImage(data: datasImage[i]) ?? UIImage())
            }
            return uiImages
        } else {
            return [UIImage()]
        }
    }

}
