//
//  ReminderCard.swift
//  HortCult
//
//  Created by Pedro Henrique Santos Rodrigues on 05/06/23.
//

import SwiftUI

struct ReminderCardView: View {
    
    @ObservedObject var plantViewModel: PlantViewModel
    
    var id = UUID()
    var imagem: String
    var plantName : String
    var descricao: String
    var cardColor : String
    var circleColor : String

    var body: some View {
        HStack(spacing: 16){
            Image(imagem)
                .frame(width: 62, height:62)
                .background(Color(circleColor))
                .cornerRadius(60)
                .padding(.leading, 20)
                .foregroundColor(.yellow)
            VStack(alignment: .leading){

                Text("\(plantName) está com sede!")
                    .font(.headline)
                    .font(.system(size: 18))
                    .foregroundColor(Color("Preto"))
                    .bold()

                Text(descricao)
                    .font(.subheadline)
                    .font(.system(size: 16))
                    .foregroundColor(Color("CinzaEscuro"))

                Button{
                    
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
            .background(Color(cardColor))
            .cornerRadius(12)
    }
}

//struct ReminderCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReminderCardView(id: UUID(), imagem: "", plantName: "", descricao: "", cardColor: "", circleColor: "")
//    }
//}
