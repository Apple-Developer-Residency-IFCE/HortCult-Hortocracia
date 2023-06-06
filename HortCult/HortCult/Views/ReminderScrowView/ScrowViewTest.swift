//
//  ScrowView.swift
//  HortCult
//
//  Created by Pedro Henrique Santos Rodrigues on 05/06/23.
//

import SwiftUI


struct ScrollViewWithHeader: View {
    @State var cards: [AnyView] = [
        AnyView(ReminderCardView(imagem: "Rega", titulo: "Batatão está com sede!", descricao: "De agua para sua plantinha", cardColor: "LembreteRega", circleColor: "LembreteCircleRega")),
        AnyView(ReminderCardView(imagem: "Rega", titulo: "Batatão está co  m sede!", descricao: "De agua para sua plantinha", cardColor: "LembreteRega", circleColor: "LembreteCircleRega"))
    ]
    
    var body: some View {
            VStack(alignment: .leading) {
                Text("Lembrete")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(Color("H1Color"))
                    .padding(.leading, 5)
                
                ScrollView(.vertical) {
                    LazyVStack(spacing: 12) {
                        ReminderCardView(imagem: "Rega", titulo: "Batatão está com sede!", descricao: "De agua para sua plantinha", cardColor: "LembreteRega", circleColor: "LembreteCircleRega")
                        
//                        ForEach(cards, id: \.self) { card in
//                            card.listRowInsets(EdgeInsets())
                                         
                    }
                }
            }
        }
    }
    
    
    
    struct ScrollViewWithHeader_Previews: PreviewProvider {
        static var previews: some View {
            ScrollViewWithHeader()
        }
    }

