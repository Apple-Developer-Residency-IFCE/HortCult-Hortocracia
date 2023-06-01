//
//  Card.swift
//  CardGenerico
//
//  Created by userext on 30/05/23.
//

import SwiftUI


import SwiftUI

struct GenericReminderCard: View {
    var carBackground : String
    var icon : String
    var circleColor : String
    var mainTitle : String
    var description : String
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClasss
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(carBackground))
            HStack(spacing: 18){
                ZStack{
                    Circle(
                    )
                    .frame(width: UIScreen.main.bounds.width * 0.16, height: UIScreen.main.bounds.width * 0.17)
                    .foregroundColor(Color(circleColor))
                    Image(systemName: icon)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.09, height: UIScreen.main.bounds.width * 0.09)

                        .foregroundColor(.white)
                }
                
                VStack(alignment: .leading){
                    Text(mainTitle)
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                        .padding(.bottom,1)
                        .padding(.top,19)
                    Text(description)
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                    Button(action: {
                        // Código a ser executado quando o botão for pressionado
                        print("Botão pressionado!")
                    }) {
                        Text("Feito")
                            .foregroundColor(.white)
                            .padding()
                            .cornerRadius(2)
                            .overlay(
                                RoundedRectangle(cornerRadius: 19)
                                    .stroke(Color.gray, lineWidth: 1.6)
                                    .padding(5)
                            )
                    }
                    .padding(.bottom, 5)
                    
                    
                }
            }


            
        }
        .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.2)
        .padding(.horizontal, 20) // 5% do width da tela
        //.padding(.vertical, UIScreen.main.bounds.height * 0.37)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        GenericReminderCard(carBackground: "", icon: "", circleColor: "", mainTitle: "", description: "")
    }
}

