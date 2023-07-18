//
//  CardProxRegaViewModel.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 18/07/23.
//

import SwiftUI

class CardProxRegaViewModel: ObservableObject {
    @Published var planta:PlantModel
    @Published var nextDate:Date
    
    let service: CoredataServices
    init(service: CoredataServices, planta: PlantModel){
        self.planta = planta
        self.service = service
        nextDate = planta.nextDate
    }
    
    func formateDate() -> Date{
        var formattedNextDate: Date = nextDate
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        let formattedString = formatter.string(from: formattedNextDate)
        formattedNextDate = formatter.date(from: formattedString) ?? Date()
        return formattedNextDate
    }
    
    func updateDatePlant(){
        planta.nextDate = formateDate()
        let _ = service.updatePlantModel(plantModel: planta, nextDate: nextDate)
    }
}
