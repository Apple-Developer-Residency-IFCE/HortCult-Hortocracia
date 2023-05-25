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
                .bold()
                .foregroundColor(Color("H1Color"))
                .padding(.bottom, 12)
                .font(.custom("Satoshi", size: 32))
        } else{
            Text(textSelector)
                .font(.custom("Satoshi", size: 24))
                .fontWeight(.medium)
                .foregroundColor(Color("H1Color"))
                .padding(.bottom, 12)
        }
    }
}

