//
//  NameInput.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 06/07/23.
//

import SwiftUI

struct NameInput: View {
    @Binding var namePlant:String
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Nome")
                .foregroundColor(Color("CinzaEscuro"))
                .fontWeight(.light)
                .font(Font.custom("Satoshi-Regular", size: 12))
            ZStack(alignment: .topLeading) {
                TextEditor(text: $namePlant)
                    .padding(.leading, 15)
                    .frame(width: 350,height: 38)
                    .font(Font.custom("Satoshi-Regular", size: 16))
                    .textCase(.lowercase)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color("CinzaClaro"), lineWidth: 1)
                    )
            }
        }.padding(.horizontal, 20)
        
    }
}

struct NameInput_Previews: PreviewProvider {
    static var previews: some View {
        NameInput(namePlant: .constant(""))
    }
}
