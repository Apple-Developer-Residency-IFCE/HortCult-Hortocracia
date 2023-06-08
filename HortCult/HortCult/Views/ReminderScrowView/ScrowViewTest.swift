//
//  ScrowView.swift
//  HortCult
//
//  Created by Pedro Henrique Santos Rodrigues on 05/06/23.
//

import SwiftUI


struct ScrollViewWithHeader: View{
    
    @State var cards: [ReminderCardView] = [
<<<<<<< HEAD
        (ReminderCardView(imagem: "Rega", titulo: "Batatão está com sede!", descricao: "De agua para sua plantinha", cardColor: "LembreteRega", circleColor: "LembreteCircleRega")),
        (ReminderCardView(imagem: "Rega", titulo: "Batatão está com sede!", descricao: "De agua para sua plantinha", cardColor: "LembreteRega", circleColor: "LembreteCircleRega"))
=======
        (ReminderCardView(imagem: "Rega", titulo: "Batatão está com sede!", descricao: "Dê agua para sua plantinha.", cardColor: "LembreteRega", circleColor: "LembreteCircleRega")),
        (ReminderCardView(imagem: "Rega", titulo: "Batatão está c om sede!", descricao: "Dê agua para sua plantinha.", cardColor: "LembreteRega", circleColor: "LembreteCircleRega"))
>>>>>>> release/2.0
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
                    ForEach(cards, id: \.id) { cards in
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
