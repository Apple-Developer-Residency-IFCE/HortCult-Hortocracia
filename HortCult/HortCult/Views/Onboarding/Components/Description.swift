//
//  Description.swift
//  EstudandoSwift
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct Description: View {
    var descriptionText: String
    var body: some View {
        Text(descriptionText)
            .font(Font.custom("Satoshi-Regular", size: 16))
            .foregroundColor(Color("Cinza"))
            .multilineTextAlignment(.center)
            .frame(width: 277, height: 66)
        Spacer()
    }
}

