//
//  FrequencyPicker.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 06/07/23.
//
//
//  PickerFrequencia.swift
//  HortCult
//
//  Created by Yohanne Moreira on 15/06/23.
//

import SwiftUI

enum Options: String, CaseIterable {
    case diario = "Todos os dias"
    case dois = "A cada 2 dias"
    case quatro = "A cada 4 dias"
    case semana = "1 vez por semana"
}

struct FrequencyPicker: View {
    
    @State private var isPickerExpanded: Bool = false
    @Binding var selectedOption: String
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Frequência de Rega")
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
                        ForEach(Options.allCases, id: \.self){ option in
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

struct FrequencyPicker_Previews: PreviewProvider {
    static var previews: some View {
        FrequencyPicker(selectedOption: .constant(""))
    }
}
