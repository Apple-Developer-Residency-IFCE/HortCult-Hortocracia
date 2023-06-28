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
                //.font(.system(size: 32))
                //.fontWeight(.heavy)
                .bold()
                .foregroundColor(Color("H1Color"))
                .padding(.bottom, 12)
                .multilineTextAlignment(.center)
                .font(.custom("Satoshi", size: 32))
                .padding(.top, 29)
                .lineLimit(268)
                .fixedSize(horizontal: false, vertical: true)
                //frame(width: 268, height: 64)
                //.font(.system(size: 16, weight: .custom(700)))
        } else{
            Text(textSelector)
                .font(.custom("Satoshi", size: 24))
                .fontWeight(.medium)
                .foregroundColor(Color("H1Color"))
                .multilineTextAlignment(.center)
                .padding(.bottom, 6)
        }
    }
}

