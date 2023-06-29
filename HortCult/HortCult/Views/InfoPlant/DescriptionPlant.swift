//
//  DescriptionPlant.swift
//  HortCult
//
//  Created by userext on 30/05/23.
//

import SwiftUI

struct DescriptionPlant: View {
    
    var planta: Plant
    
    var body: some View {
        VStack{
            HStack(alignment: .center){
                Text(planta.name ?? "")
                    .bold()
                    .foregroundColor(Color("VerdeEscuro"))
                    //.multilineTextAlignment(.center)
                    .font(.custom("Satoshi-Bold", size: 28))
                    //.padding(.top, 29)
                    //.lineLimit(268)
                    //.fixedSize(horizontal: false, vertical: true)
                Spacer()
                Text(planta.category ?? "")
                    .padding(.horizontal, 13)
                    .padding(.vertical, 8)
                    .foregroundColor(Color("Cinza"))
                    .font(.custom("Satoshi-Regular", size: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color("VerdeEscuro"), lineWidth: 2)
                    )
            }.padding(.bottom, 24)
            Text(planta.information ?? "")
                .font(.custom("Satoshi-Regular", size: 16))
        }
        .padding(.horizontal, 20)
        
    }
}
//
//struct DescriptionPlant_Previews: PreviewProvider {
//    static var previews: some View {
//        DescriptionPlant(planta: )
//    }
//}
