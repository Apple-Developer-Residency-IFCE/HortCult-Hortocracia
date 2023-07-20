//
//  CarrosselDeDicas.swift
//  HortCult
//
//  Created by Pedro Henrique Santos Rodrigues on 19/07/23.
//

import SwiftUI

struct CarrosselDeDicas: View {
    
    @State var selectedPage = 0
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                
                Text("Dicas para sua horta!")
                    .font(Font.custom("Satoshi-Bold", size: 28))
                    .font(.system(size: 28))
                    .frame(width: 276, height: 38)
                    .foregroundColor(Color("VerdeEscuro"))
                    .padding(.bottom, 15)
                TabView(selection: $selectedPage) {
                    CardsCarrossel(dicaSelecionada: 1)
                        .tag(0)
                    
                    CardsCarrossel(dicaSelecionada: 2)
                        .tag(1)
                    
                    CardsCarrossel(dicaSelecionada: 3)
                        .tag(2)
                    
                    CardsCarrossel(dicaSelecionada: 4)
                        .tag(3)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(width: 349, height: 120)
                
            }.padding(.horizontal)
            
            HStack(alignment: .center){
                Circle()
                    .frame(width: 6.87, height: 6.87)
                    .foregroundColor(selectedPage == 0 ? Color("VerdeEscuro") : Color("CinzaBotao"))
                Circle()
                    .frame(width: 6.87, height: 6.87)
                    .foregroundColor(selectedPage == 1 ? Color("VerdeEscuro") : Color("CinzaBotao"))
                Circle()
                    .frame(width: 6.87, height: 6.87)
                    .foregroundColor(selectedPage == 2 ? Color("VerdeEscuro") : Color("CinzaBotao"))
                Circle()
                    .frame(width: 6.87, height: 6.87)
                    .foregroundColor(selectedPage == 3 ? Color("VerdeEscuro") : Color("CinzaBotao"))
            }
        }
    }
}

struct CarrosselDeDicas_Previews: PreviewProvider {
    static var previews: some View {
        CarrosselDeDicas()
    }
}

