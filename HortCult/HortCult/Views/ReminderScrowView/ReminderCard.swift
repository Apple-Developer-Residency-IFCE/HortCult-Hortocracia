//
//  ReminderCard.swift
//  HortCult
//
//  Created by Pedro Henrique Santos Rodrigues on 05/06/23.
//

import SwiftUI

struct ReminderCardView: View {
    
    @EnvironmentObject var plantViewModel: PlantViewModel
    
    var id = UUID()
    
    
    @State var plant: Plant
    
    var body: some View {
        
        var auxFrequency: Int = 0
        
        HStack(spacing: 16){
            Image("Water")
                .frame(width: 62, height:62)
                .background(Color("LembreteCircleRega"))
                .cornerRadius(60)
                .padding(.leading, 20)
                .foregroundColor(.yellow)
            VStack(alignment: .leading){

                Text("\(plant.name ?? "") está com sede!")
                    .font(.headline)
                    .font(.system(size: 18))
                    .foregroundColor(Color("Preto"))
                    .bold()

                Text("Testando")
                    .font(.subheadline)
                    .font(.system(size: 16))
                    .foregroundColor(Color("CinzaEscuro"))

                Button{
                    if let numero = Int(plant.frequency ?? "") {
                        auxFrequency = numero
                    } else {
                        print("Erro ao converter a string para Int")
                    }
                    var nextDate: Date = Date()
                    nextDate = Calendar.current.date(byAdding: .day, value: auxFrequency, to: nextDate)!
                    plantViewModel.updatePlant(plant: plant, name: plant.name ?? "", information: plant.information ?? "", category: plant.category ?? "", frequency: plant.frequency ?? "", nextDate: nextDate, image: plant.image ?? Data())
                } label: {
                    Text("Feito")
                        .font(Font.custom("Satoshi-Regular", size: 12))
                        .foregroundColor(Color("Cinza"))
                }.frame(width: 50, height: 30)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color("Cinza"), lineWidth: 1)
                )

            }
            Spacer()
        }.frame(width: 350, height: 118)
            .background(Color("LembreteRega"))
            .cornerRadius(12)
    }
}

