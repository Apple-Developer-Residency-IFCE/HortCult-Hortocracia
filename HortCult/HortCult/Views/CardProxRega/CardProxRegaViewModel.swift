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
    
    func convertToDate(freq:String) -> Int{
        var day:Int
        if (freq == "Todos os dias"){
            day = 1
        }else if(freq == "A cada 2 dias"){
            day = 2
        }else if(freq == "A cada 4 dias"){
            day = 4
        }else{
            day = 7
        }
        return day
    }
    
    func advanceNextDate(){
        let calendar = Calendar.current
        let days = convertToDate(freq: planta.frequency)
        guard let newNextDate = calendar.date(byAdding: .day, value: days, to: nextDate) else {return }
        nextDate = newNextDate
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
        advanceNextDate()
        planta.nextDate = formateDate()
        let _ = service.updatePlantModel(plantModel: planta, nextDate: nextDate)
    }
    
//    func getDate() -> String{
//        
//    }
}
