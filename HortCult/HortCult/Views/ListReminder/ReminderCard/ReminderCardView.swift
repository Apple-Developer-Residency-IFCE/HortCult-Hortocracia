//
//  ReminderCard.swift
//  HortCult
//
//  Created by Pedro Henrique Santos Rodrigues on 05/06/23.
//

import SwiftUI

protocol ReminderCardDelegate {
    func load()
}

struct ReminderCardView: View {

    @EnvironmentObject var reminderCardViewModel:ReminderCardViewModel
    @State var dataProxRega: String = ""
//    var planta: PlantModel
    
    let delegate: ReminderCardDelegate
    
    var body: some View {
        HStack(spacing: 16){
            Image("Water")
                .frame(width: 62, height:62)
                .background(Color("LembreteCircleRega"))
                .cornerRadius(60)
                .padding(.leading, 20)
                .foregroundColor(.yellow)
            VStack(alignment: .leading){

                Text("\(reminderCardViewModel.planta.name) está com sede!")
                    .font(.headline)
                    .font(Font.custom("Satoshi-Bold", size: 18))
                    .foregroundColor(Color("Preto"))
                    .bold()
                
                Text("Dê água para a sua plantinha") // Futuramente pode receber uma mensagem diferente dependendo do que a planta precisa.
                    .font(.subheadline)
                    .font(Font.custom("Satoshi-Regular", size: 16))
                    .foregroundColor(Color("CinzaEscuro"))

                Button{
                    reminderCardViewModel.updateDatePlant()
                    let formatter = DateFormatter()
                    formatter.dateFormat = "dd/MM/yyyy"
                    dataProxRega = formatter.string(from: reminderCardViewModel.nextDate)
                    delegate.load()
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

