//
//  NameDescription.swift
//  HortCult
//
//  Created by João Vitor Alves Holanda on 13/06/23.
//

import SwiftUI

struct NameDescription: View {
    
    @Binding var nameVegetable: String 
    @Binding var descriptionVegetable: String
    @State private var isEditing: Bool = false
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Nome")
                .foregroundColor(Color("CinzaEscuro"))
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
                .foregroundColor(Color("CinzaEscuro"))
                .fontWeight(.light)
                .font(.system(size: 12))
            ZStack(alignment: .topLeading) {
                TextEditor(text: $descriptionVegetable)
                    .padding(.leading, 15)
                    .frame(height: 200)
                    .font(.system(size: 16))
                    .textCase(.lowercase)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("CinzaClaro"), lineWidth: 1)
                    )
                    .onTapGesture {
                        isEditing = true
                    }
                if descriptionVegetable.isEmpty && !isEditing {
                    Text("Insira uma descrição")
                        .foregroundColor(Color("CinzaClaro"))
                        .padding(.leading, 15)
                        .padding(.top, 8)
                }
            }
        }
        .padding()
    }
}

struct NameDescription_Previews: PreviewProvider {
    static var previews: some View {
        Teste()
    }
}

struct Teste: View {
    @State var name: String = "Teste"
    @State var description: String = "Exemplo"
    
    var body: some View {
        NameDescription(nameVegetable: $name, descriptionVegetable: $description)
        
    }
}

