//
//  NameDescription.swift
//  HortCult
//
//  Created by João Vitor Alves Holanda on 13/06/23.
//

import SwiftUI

struct NameDescription: View {
    
    @State private var nameVegetable: String = ""
    @State private var descriptionVegetable: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Adicionar Vegetal")
                .font(.title)
                .font(.system(size: 28))
                .fontWeight(.bold)
                .padding(.bottom, 20)
                .foregroundColor(Color("H1Color"))
            Text("Nome")
                .foregroundColor(Color("Cinza"))
                .fontWeight(.light)
                .font(.system(size: 12))
            TextField("Insira um nome", text: $nameVegetable)
                .padding(.leading, 20)
                .frame(height: 38)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color("CinzaClaro"), lineWidth: 1)
                )
            Spacer().frame(height: 28)
            Text("Descrição")
                .foregroundColor(Color("Cinza"))
                .fontWeight(.light)
                .font(.system(size: 12))
            TextField("Insira uma descrição", text: $descriptionVegetable)
                .padding(.bottom, 160)
                .padding(.leading, 15)
                .frame(height: 200)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("CinzaClaro"), lineWidth: 1)
                )
            
            
        }
        .padding()
    }
}

struct NameDescription_Previews: PreviewProvider {
    static var previews: some View {
        NameDescription()
    }
}
