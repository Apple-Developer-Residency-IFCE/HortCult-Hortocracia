//
//  FrequencyPicker.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 06/07/23.
//

import SwiftUI

enum options: String, CaseIterable {
    case diario = "Todos os dias"
    case dois = "A cada 2 dias"
    case quatro = "A cada 4 dias"
    case semana = "1 vez por semana"
}


struct FrequencyPicker: View {
    
    @State private var isPickerExpanded: Bool = false
    @State private var ButtonHidden: Bool = false
    @Binding var selectedOption: String
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Frequência de Rega")
                    .font(Font.custom("Satoshi-Regular", size: 12))
                if (!ButtonHidden){
                    Button{
                        ButtonHidden.toggle()
                        isPickerExpanded.toggle()
                        
                    } label: {
                        if (selectedOption.isEmpty){
                            Text(selectedOption)
                                .font(Font.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color("CinzaClaro"))
                                .padding(.leading, 16)
                            Spacer()
                        }
                        else {
                            Text(selectedOption)
                                .font(Font.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color("Cinza"))
                                .padding(.leading, 16)
                            Spacer()
                        }
                        Image("Arrow-Bottom")
                            .padding(.trailing, 22)
                        
                    }.frame(width: 380, height: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color("CinzaClaro"), lineWidth: 1)
                            
                        )
                }
                
                
                if (isPickerExpanded){
                    VStack(alignment: .center){
                        
                        
                        ForEach(options.allCases, id: \.self){
                            option in  Button(action:{
                                selectedOption = option.rawValue
                                isPickerExpanded.toggle()
                                ButtonHidden.toggle()
                                
                            }){
                                
                                
                                VStack(alignment: .leading){
                                    if (option == options.diario){
                                        HStack{
                                            Text(selectedOption)
                                                .font(Font.custom("Satoshi-Regular", size: 16))
                                                .foregroundColor(Color("Cinza"))
                                            Spacer()
                                            Image("Arrow-Top")
                                                .padding(.trailing, 22)
                                        }
                                        .padding(.bottom, 18)
                                    }
                                    if(option.rawValue != selectedOption){
                                        Text(option.rawValue)
                                            .font(Font.custom("Satoshi-Regular", size: 16))
                                            .foregroundColor(Color("CinzaEscuro"))
                                            .padding(.bottom, 18)
                                    }
                                }
                                
                                Spacer()
                            }
                        }
                    } .frame(width: 350)
                        .padding(.top, 9)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Cinza"), lineWidth: 1)
                            
                            
                            
                        )
                }
                
            }
            Spacer()
            
            
        }
    }
}
//struct FrequencyPicker_Previews: PreviewProvider {
//    static var previews: some View {
//        FrequencyPicker()
//    }
//}
