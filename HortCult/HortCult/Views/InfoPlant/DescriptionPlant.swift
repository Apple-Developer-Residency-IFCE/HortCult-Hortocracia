//
//  DescriptionPlant.swift
//  HortCult
//
//  Created by userext on 30/05/23.
//

import SwiftUI

struct DescriptionPlant: View {
    var body: some View {
        VStack{
            HStack(alignment: .center){
                Text("Tomatinho")
                    .bold()
                    .foregroundColor(Color("H1Color"))
                    //.multilineTextAlignment(.center)
                    .font(.custom("Satoshi", size: 28))
                    //.padding(.top, 29)
                    //.lineLimit(268)
                    //.fixedSize(horizontal: false, vertical: true)
                Spacer()
                Text("Hortaliças")
                    //.padding(.top, 12)
                    .padding(12)
                    .font(.custom("Sotoshi", size: 14))
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color("H1Color"), lineWidth: 2)
                    )
            }
            Text("O tomate é um fruto rico em vitamina C, vitamina A, vitamina K e licopeno, que é um potente antioxidante, ajudando a manter a saúde da pele, fortalecer o sistema imunológico e evitar doenças cardiovasculares, como infarto e aterosclerose.")
                .font(.custom("Satoshi", size: 16))
        }.padding(.horizontal, 20)
    }
}

struct DescriptionPlant_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionPlant()
    }
}
