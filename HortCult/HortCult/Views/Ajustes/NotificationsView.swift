//
//  NotificationsView.swift
//  HortCult
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct NotificationsView: View {
    
    @State private var selectedOption = 0
    let options = ["00:00", "8:00", "12:00", "14:00"]

    var body: some View {
        VStack(alignment: .leading){
            Text("Notificações")
                .font(Font.custom("Satoshi-Regular", size: 16))
            
            Text("Horário")
                .font(Font.custom("Satoshi-Regular", size: 12))
                .padding(.top, 24)
            HStack{
                Button{
                    
                } label:{
                    Picker("Selecione uma opção", selection: $selectedOption) {
                        ForEach(0..<options.count) { index in
                            Text(options[index])
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding(.leading, 16)
                    Spacer()
                    Image("Relogio")
                        .padding(.trailing, 11)
                    
                }.frame(width: 350, height: 38)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color("Cinza"), lineWidth: 1)
                        
                    )
            }
                
        }.padding(.leading, 20)
    
        
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
