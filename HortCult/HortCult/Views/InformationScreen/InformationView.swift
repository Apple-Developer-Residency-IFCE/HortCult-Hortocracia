//
//  InformationView.swift
//  HortCult
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct InformationView: View {
    var body: some View {
        NavigationView{
            VStack{
                
                    CustomNavBarInfoView {
                        
                        ImagesListView()
                    }
                    // CustomNavBarInfoView()
                    
                
                HStack {
                    VStack(alignment: .leading){
                        Text("Frequência de Rega")
                            .font(.system(size: 16))
                            .foregroundColor(Color("H4Color"))
                            .padding(.leading, 20)
                        Text("Todos os Dias")
                            .font(.system(size: 18))
                            .foregroundColor(Color("H4Color"))
                            .bold()
                            .padding(.leading, 20)
                            .padding(.top, 4)
                        
                    }
                    Spacer()
                }
                Button(action: {
                    
                }) {
                    HStack {
                        Image("Editar")
                        Text("Editar Informações")
                            .font(.system(size: 16))
                            .bold()
                    }
                    .foregroundColor(Color("H1Color"))
                    .padding()
                    .frame(width: 275, height: 42)
                    .background(.white)
                    .cornerRadius(40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color("H1Color"), lineWidth: 2)
                    )
                }
                .padding(.top, 20)
                .padding(.bottom, 16)
                
                Button(action: {
                    
                }) {
                    HStack {
                        Image("Remover")
                        Text("Excluir da minha horta")
                            .font(.system(size: 16))
                            .bold()
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 275, height: 42)
                    .background(Color("Vermelho"))
                    .cornerRadius(40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color("Vermelho"), lineWidth: 2)
                    )
                }
                .padding(.bottom, 184)
            }
        }
       .navigationBarHidden(true)
        
    }
    
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
