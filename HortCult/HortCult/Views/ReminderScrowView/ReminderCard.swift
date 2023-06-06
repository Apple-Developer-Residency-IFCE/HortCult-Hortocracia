//
//  ReminderCard.swift
//  HortCult
//
//  Created by Pedro Henrique Santos Rodrigues on 05/06/23.
//

import SwiftUI

struct ReminderCardView: View {
    var imagem: String
    var titulo : String
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

                Text(titulo)
                    .font(Font.custom("Satoshi-Regular", size: 18))
                    .foregroundColor(.black)
                    .bold()

                Text(descricao)
                    .font(Font.custom("Satoshi-Regular", size: 16))
                    .foregroundColor(Color("CinzaEscuro"))

                Button{
                    // Action do botao
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

struct ReminderCardView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderCardView(imagem: "", titulo: "", descricao: "", cardColor: "", circleColor: "")
    }
}
