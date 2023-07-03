//
//  TittleSelector.swift
//  EstudandoSwift
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct TittleSelector: View {
    var sizeSelector : Bool
    var textSelector : String
    var body: some View {
        if sizeSelector{
            Text(textSelector)
                .font(Font.custom("Satoshi-Bold", size: 28))
                .foregroundColor(Color("VerdeEscuro"))
                .padding(.bottom, 12)
                .multilineTextAlignment(.center)
                .padding(.top, 29)
                .lineLimit(268)
                .fixedSize(horizontal: false, vertical: true)
                //frame(width: 268, height: 64)
                //.font(.system(size: 16, weight: .custom(700)))
        } else{
            Text(textSelector)
                .font(.custom("Satoshi-Medium", size: 24))
                .fontWeight(.medium)
                .foregroundColor(Color("VerdeEscuro"))
                .multilineTextAlignment(.center)
                .padding(.bottom, 6)
        }
    }
}

struct TittleSelector_Previews: PreviewProvider {
    static var previews: some View {
        TittleSelector(sizeSelector: true, textSelector: "Cuida")
    }
}
