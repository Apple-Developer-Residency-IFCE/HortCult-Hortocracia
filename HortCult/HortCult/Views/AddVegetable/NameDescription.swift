//
//  NameDescription.swift
//  HortCult
//
//  Created by João Vitor Alves Holanda on 13/06/23.
//

import SwiftUI

struct NameDescription: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Adicionar Vegetal")
                .font(.title)
                .font(.system(size: 28))
                .fontWeight(.bold)
                .padding()
                .foregroundColor(Color("H1Color"))
            Text("Nome")
                .foregroundColor(Color("Cinza"))
                .fontWeight(.light)
                .font(.system(size: 12))
            TextField("Insira um nome", text: $text)
                //.textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color("Cinza"), lineWidth: 1)
                )               // .border(.blue)


        }
        .padding()
        .border(.red)
    }
}

struct NameDescription_Previews: PreviewProvider {
    static var previews: some View {
        NameDescription()
    }
}
