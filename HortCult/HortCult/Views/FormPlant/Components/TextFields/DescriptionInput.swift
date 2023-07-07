//
//  DescriptionInput.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 06/07/23.
//

import SwiftUI

struct DescriptionInput: View {
    @Binding var descriptionVegetable: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Descrição")
                .foregroundColor(Color("CinzaEscuro"))
                .fontWeight(.light)
                .font(Font.custom("Satoshi-Regular", size: 12))

            TextEditor(text: $descriptionVegetable)
                .font(Font.custom("Satoshi-Regular", size: 16))
                .textCase(.lowercase)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("CinzaClaro"), lineWidth: 1)
                    )
                .frame(width: 380,height: 160)
        }
    }
}
