//
//  ScrowView.swift
//  HortCult
//
//  Created by Pedro Henrique Santos Rodrigues on 05/06/23.
//

import SwiftUI


struct ScrollViewWithHeader: View{
    
    @State var cards: [ReminderCardView] = [
        (ReminderCardView(imagem: "Rega", titulo: "Batatão está com sede!", descricao: "Dê agua para sua plantinha.", cardColor: "LembreteRega", circleColor: "LembreteCircleRega")),
        (ReminderCardView(imagem: "Rega", titulo: "Batatão está c om sede!", descricao: "Dê agua para sua plantinha.", cardColor: "LembreteRega", circleColor: "LembreteCircleRega"))
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Lembretes")
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .foregroundColor(Color("H1Color"))
                .padding(.leading, -3)
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    ForEach(cards, id: \.titulo) { cards in
                        cards
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
}
