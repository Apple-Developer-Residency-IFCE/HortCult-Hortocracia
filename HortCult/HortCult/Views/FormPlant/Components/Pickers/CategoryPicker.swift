//
//  CategoryPicker.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 06/07/23.
//

import SwiftUI

enum Select: String, CaseIterable {
    case hortalicas = "Hortaliças"
    case legumes = "Legumes"
    case pimentas = "Pimentas"
    case medicinais = "Medicinais"
    case temperos = "Temperos"
}

struct CategoryPicker: View {
 
    @State private var isPickerExpanded: Bool = false
    @Binding var selectedOption: String
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Categoria")
                    .font(Font.custom("Satoshi-Regular", size: 12))

                VStack(alignment: .leading, spacing: 18){
                    Button{
                        isPickerExpanded.toggle()
                    }label: {
                        Text(selectedOption.isEmpty ? "Selecionar..." : selectedOption)
                            .font(Font.custom("Satoshi-Regular", size: 16))
                            .padding(.leading, 20)
                            .foregroundColor(Color("Cinza"))
                        
                        Spacer()
                        Image("Arrow-Bottom")
                            .rotationEffect(Angle(degrees: isPickerExpanded ? 180 : 0))
                            .padding(.trailing, 22)
                        
                    }
                    if isPickerExpanded {
                        ForEach(Select.allCases, id: \.self){ option in
                            if(option.rawValue != selectedOption){
                                Button(action:{
                                    selectedOption = option.rawValue
                                    isPickerExpanded.toggle()
                                    
                                }){
    
                                    Text(option.rawValue)
                                        .font(Font.custom("Satoshi-Regular", size: 16))
                                        .foregroundColor(Color("CinzaEscuro"))
                                        .padding(.leading, 20)
                                    Spacer()
                                }
                            }
                        }
                    }
                }
                .padding(.vertical, 8)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("Cinza"), lineWidth: 1)
                )
            }
            Spacer()
        }.padding(.horizontal, 20)
    }
}
struct CategoryPicker_Previews: PreviewProvider {
    static var previews: some View {
        CategoryPicker(selectedOption: .constant(""))
    }
}
