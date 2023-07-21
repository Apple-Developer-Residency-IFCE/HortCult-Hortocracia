//
//  CardsCarrossel.swift
//  HortCult
//
//  Created by Pedro Henrique Santos Rodrigues on 19/07/23.
//

import SwiftUI

struct CardsCarrossel: View {
    var dicaSelecionada: Int
    @State private var isSheetPresented = false
    @State private var isSheetPresented2 = false
    var body: some View {
        switch dicaSelecionada{
            
        case 1:
                ZStack{
                    Rectangle()
                        .cornerRadius(12)
                        .frame(width: 349, height: 120)
                        .foregroundColor(Color("BrancoMinhaHorta"))
                    HStack{
                        Image("DicaSaudavel")
                            .resizable()
                            .frame(width: 96, height: 96)
                            .cornerRadius(8)
                        VStack(alignment: .leading){
                            Text("Sua horta é saudável?")
                                .font(Font.custom("Satoshi-Bold", size: 16))
                                .frame(width: 163, height: 22)
                                .padding(.bottom, -2) 
                            Text("Segundo o PlastPrime, um blog de cuidados com hortas, a impor ... ")
                                .font(Font.custom("Satoshi-Regular", size: 12))
                                .frame(width: 213, height: 31)
                                .padding(.leading,-12)
                            ZStack{
                                Rectangle()
                                    .frame(width: 62, height: 24)
                                    .cornerRadius(20)
                                    .foregroundColor(Color("CinzaBotao"))
                                Button(action: {
                                    isSheetPresented = true
                                }, label: {
                                    Text("Ler mais")
                                        .font(Font.custom("Satoshi-Regular", size: 12))
                                        .foregroundColor(.black)
                                }
                                )
                            }
                            .padding(.top, 8)
                            
                        }
                    }
                }
                .sheet(isPresented: $isSheetPresented, content: {DicaSaudavelView()})
        case 2:
                ZStack{
                    Rectangle()
                        .cornerRadius(12)
                        .frame(width: 349, height: 120)
                        .foregroundColor(Color("BrancoMinhaHorta"))
                    HStack{
                        Image("DicaSucesso")
                            .resizable()
                            .frame(width: 96, height: 96)
                            .cornerRadius(8)
                        VStack(alignment: .leading){
                            Text("Uma horta de sucesso")
                                .font(Font.custom("Satoshi-Bold", size: 16))
                                .frame(width: 165, height: 22)
                                .padding(.bottom, -2)
                            Text("Segundo o Plantei, um blog de cuidados com hortas e plantas, a ...")
                                .font(Font.custom("Satoshi-Regular", size: 12))
                                .frame(width: 213, height: 31)
                                .padding(.leading,-12)
                            ZStack{
                                Rectangle()
                                    .frame(width: 62, height: 24)
                                    .cornerRadius(20)
                                    .foregroundColor(Color("CinzaBotao"))
                                Button(action: {
                                    isSheetPresented = true
                                }, label: {
                                    Text("Ler mais")
                                        .font(Font.custom("Satoshi-Regular", size: 12))
                                        .foregroundColor(.black)
                                })
                            }.padding(.top, 8)
                            
                        }
                    }
                }.sheet(isPresented: $isSheetPresented, content: {DicaSucessoView()})
        case 3:
                ZStack{
                    Rectangle()
                        .cornerRadius(12)
                        .frame(width: 349, height: 120)
                        .foregroundColor(Color("BrancoMinhaHorta"))
                    HStack{
                        Image("DicaSuspensa")
                            .resizable()
                            .frame(width: 96, height: 96)
                            .cornerRadius(8)
                        VStack(alignment: .leading){
                            Text("Horta suspensa")
                                .font(Font.custom("Satoshi-Bold", size: 16))
                                .frame(width: 115, height: 22)
                                .padding(.bottom, -2)
                            Text("Há inúmeras formas de montar uma hortinha e você pode definir os...")
                                .font(Font.custom("Satoshi-Regular", size: 12))
                                .frame(width: 213, height: 31)
                                .padding(.leading,-12)
                            ZStack{
                                Rectangle()
                                    .frame(width: 62, height: 24)
                                    .cornerRadius(20)
                                    .foregroundColor(Color("CinzaBotao"))
                                Button(action: {
                                    isSheetPresented = true
                                }, label: {
                                    Text("Ler mais")
                                        .font(Font.custom("Satoshi-Regular", size: 12))
                                        .foregroundColor(.black)
                                })
                            }.padding(.top, 8)
                            
                        }
                    }
                }.sheet(isPresented: $isSheetPresented, content: {DicaSuspensaView()})
        case 4:
                ZStack{
                    Rectangle()
                        .cornerRadius(12)
                        .frame(width: 349, height: 120)
                        .foregroundColor(Color("BrancoMinhaHorta"))
                    HStack{
                        Image("DicaPet")
                            .resizable()
                            .frame(width: 96, height: 96)
                            .cornerRadius(8)
                        VStack(alignment: .leading){
                            Text("Horta para pets")
                                .font(Font.custom("Satoshi-Bold", size: 16))
                                .frame(width: 116, height: 22)
                                .padding(.bottom, -2)
                            Text("Você já pensou em promover uma alimentação mais natural para os ...")
                                .font(Font.custom("Satoshi-Regular", size: 12))
                                .frame(width: 213, height: 31)
                                .padding(.leading,-12)
                            ZStack{
                                Rectangle()
                                    .frame(width: 62, height: 24)
                                    .cornerRadius(20)
                                    .foregroundColor(Color("CinzaBotao"))
                                Button(action: {
                                    isSheetPresented = true
                                }, label: {
                                    Text("Ler mais")
                                        .font(Font.custom("Satoshi-Regular", size: 12))
                                        .foregroundColor(.black)
                                    
                                })
                            }.padding(.top, 8)
                            
                        }
                    }
                }.sheet(isPresented: $isSheetPresented, content: {DicaPetView()})
        default:
            EmptyView()
        }
    }
}
struct CardsCarrossel_Previews: PreviewProvider {
    static var previews: some View {
        CardsCarrossel(dicaSelecionada: 1)
    }
}
