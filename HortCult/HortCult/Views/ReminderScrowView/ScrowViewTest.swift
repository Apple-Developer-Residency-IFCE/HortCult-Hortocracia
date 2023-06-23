//
//  ScrowView.swift
//  HortCult
//
//  Created by Pedro Henrique Santos Rodrigues on 05/06/23.
//

import SwiftUI

struct ScrollViewWithHeader: View{
    
    @EnvironmentObject var plantViewModel: PlantViewModel
    
//    init(plantViewModel: PlantViewModel) {
//            self.plantViewModel = plantViewModel
//        }
//    @State var cards: [ReminderCardView] = [
//        (ReminderCardView(imagem: "Water", plantName: "", descricao: "De agua para sua plantinha", cardColor: "LembreteRega", circleColor: "LembreteCircleRega")),
//        (ReminderCardView(imagem: "Water", plantName: "", descricao: "De agua para sua plantinha", cardColor: "LembreteRega", circleColor: "LembreteCircleRega")),
//        (ReminderCardView(imagem: "Water", plantName: "", descricao: "Dê agua para sua plantinha.", cardColor: "LembreteRega", circleColor: "LembreteCircleRega")),
//        (ReminderCardView(imagem: "Water", plantName: "", descricao: "Dê agua para sua plantinha.", cardColor: "LembreteRega", circleColor: "LembreteCircleRega"))
//    ]
    
    
    
    var body: some View {
        
        @State var filtedPlants = plantViewModel.filterPlant()
        
        VStack(alignment: .leading) {
            Text("Lembretes")
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .foregroundColor(Color("VerdeEscuro"))
                .padding(.leading, 5)
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    
                    ForEach(filtedPlants, id: \.id){ plantas in
                        ReminderCardView(plant: plantas)
                    }
                    //                    ForEach(cards, id: \.id) { cards in
                    //                        cards
                    //                        ForEach(cards, id: \.self) { card in
                    //                            card.listRowInsets(EdgeInsets())
                    
                }
            }
        }
    }
        
}
