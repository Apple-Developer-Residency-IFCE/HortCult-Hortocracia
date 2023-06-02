//
//  AjustesView.swift
//  HortCult
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct AjustesView: View {
    
    @State private var isToggleOn = false
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack{
                Text("Ajustes")
                    .font(Font.custom("Satoshi-Regular", size: 28))
                    .foregroundColor(Color("VerdeEscuro"))
            }.padding(.leading, 24)
                .padding(.bottom, 20)
            HStack{
                Text("Tema")
                    .font(Font.custom("Satoshi-Regular", size: 18))
                    .foregroundColor(Color("VerdeEscuro"))
                Spacer()
                
            }.padding(.leading, 20)
            HStack{
                Text("Notificações Push")
                    .font(Font.custom("Satoshi-Regular", size: 18))
                    .foregroundColor(Color("VerdeEscuro"))
                Spacer()
                Toggle("", isOn: $isToggleOn)
            }.padding(.leading, 20)
                .padding(.bottom, 16)
            
            if(isToggleOn){
                NotificationsView()
            }
        }
    }
}

struct AjustesView_Previews: PreviewProvider {
    static var previews: some View {
        AjustesView()
    }
}
