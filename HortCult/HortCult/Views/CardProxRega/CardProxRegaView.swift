//
//  CardProxRegaView.swift
//  HortCult
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct CardProxRegaView: View {
    var imagem: String = "Water"
    @State var dataProxRega: String
    @EnvironmentObject var plantViewModel: PlantViewModel
    @State var plant: Plant
    var body: some View {
        var auxFrequency: Int = 0
        HStack(spacing: 16){
            Image(imagem)
                .frame(width: 52, height: 52)
                .background(Color("Azul").opacity(0.1))
                .cornerRadius(60)
                .padding(.leading, 20)
            
            VStack(alignment: .leading){
                
                Text("Próxima rega:")
                    .font(Font.custom("Satoshi-Regular", size: 16))
                    .foregroundColor(Color("CinzaEscuro"))
                
                Text(dataProxRega)
                    .font(Font.custom("Satoshi-Regular", size: 18))
                    .foregroundColor(Color("Preto"))
                
                Button{
                    if let numero = Int(plant.frequency!) {
                        auxFrequency = numero
                    } else {
                        print("Erro ao converter a string para Int")
                    }
                    
                    let formatter = DateFormatter()
                    formatter.dateFormat = "MM/dd/yyyy"
                    var nextDate: Date = Date()
                    nextDate = formatter.date(from: String(nextDate.formatted().prefix(9))) ?? Date()
                    nextDate = Calendar.current.date(byAdding: .day, value: auxFrequency, to: nextDate)!
                    plantViewModel.updatePlant(plant: plant, name: plant.name ?? "", information: plant.information ?? "", category: plant.category ?? "", frequency: plant.frequency ?? "", nextDate: nextDate, image: plant.image ?? Data())
                    plant = plantViewModel.getPlantId(id: plant.id!)!
                    dataProxRega = String(plant.nextDate!.formatted().prefix(10))
                } label: {
                    Text("Marcar como regado")
                        .font(Font.custom("Satoshi-Regular", size: 12))
                        .foregroundColor(Color("Cinza"))
                }.frame(width: 131, height: 28)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color("Cinza"), lineWidth: 1)
                )

            }
            Spacer()
        }.frame(width: 350, height: 118)
            .background(Color("Azul").opacity(0.2))
            .cornerRadius(12)
            
    }
}

//struct CardProxRegaView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardProxRegaView(dataProxRega: "", plant: )
//    }
//}
