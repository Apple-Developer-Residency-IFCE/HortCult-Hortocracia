//
//  AjustesView.swift
//  HortCult
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct AjustesView: View {
    
    @AppStorage ("isToggleOn") private var isToggleOn = false
    @AppStorage ("selectedTheme")private var selectedTheme: Choice?
    @AppStorage ("selectedHour") private var selectedHour: String = "00:00"
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading){
                Image(selectedTheme == .Escuro ? "Topbardark" : "Topbar")
                
                HStack{
                    Text("Ajustes")
                        .font(Font.custom("Satoshi-Bold", size: 28))
                        .foregroundColor(Color("VerdeEscuro"))
                        .bold()
                        .padding(.top, 20)
                }.padding(.leading, 24)
                    .padding(.bottom, 20)
                HStack{
                    Text("Tema")
                        .font(Font.custom("Satoshi-Regular", size: 18))
                        .foregroundColor(Color("VerdeEscuro"))
                        .bold()
                    Spacer()
                    NavigationLink {
                        ThemeView()
                    } label: {
                        HStack {
                            switch selectedTheme {
                            case .Claro:
                                Text("Claro")
                                    .font(Font.custom("Satoshi-Regular", size: 16))
                                    .foregroundColor(Color("Preto"))
                                    .padding(.trailing, 6)
                            case .Escuro:
                                Text("Escuro")
                                    .font(Font.custom("Satoshi-Regular", size: 16))
                                    .foregroundColor(Color("Preto"))
                                    .padding(.trailing, 6)
                            case .Padrao:
                                Text("Padrão")
                                    .font(Font.custom("Satoshi-Regular", size: 16))
                                    .foregroundColor(Color("Preto"))
                                    .padding(.trailing, 6)
                            case .none:
                                Text("Claro")
                                    .font(Font.custom("Satoshi-Regular", size: 16))
                                    .foregroundColor(Color("Preto"))
                                    .padding(.trailing, 6)
                            }
                            
                            Image(selectedTheme == .Escuro ? "DropdownLight" : "Dropdown")
                                .rotationEffect(Angle(degrees: -90))
                                .padding(.trailing, 20)
                        }
                    }
                }
                .padding(.leading, 20)
                .padding(.top, 53)
                .padding(.bottom, 31)
                
                Divider()
                
                HStack{
                    Text("Notificações Push")
                        .font(Font.custom("Satoshi-Regular", size: 18))
                        .foregroundColor(Color("VerdeEscuro"))
                        .bold()
                    Spacer()
                    Toggle("", isOn: $isToggleOn)
                        .padding(.trailing, 20)
                }.padding(.leading, 20)
                    .padding(.top, 24)
                    .padding(.bottom, 31)
                
                Divider()
                    .padding(.bottom, 16)
                    .onChange(of: isToggleOn) {
                    newValue in
                        
                            NotificationManager.shared.cancelScheduledNotification()
                    
                }
                if(isToggleOn){
                    NotificationsView()
                }
                    Spacer()
                
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all)
        
        
        
    }
    
}

struct AjustesView_Previews: PreviewProvider {
    static var previews: some View {
        AjustesView()
    }
}
