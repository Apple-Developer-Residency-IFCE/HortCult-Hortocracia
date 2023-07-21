//
//  ListReminderCardView.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 20/07/23.
//

import SwiftUI

struct ListReminderCardView: View, ReminderCardDelegate {
    
    @EnvironmentObject var listReminderViewModel:ListReminderViewModel
    @State var plantasFiltradas:[PlantModel] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Lembretes")
                .font(Font.custom("Satoshi-Bold", size: 28))
                .fontWeight(.bold)
                .padding()
                .foregroundColor(Color("VerdeEscuro"))
                .padding(.leading, 5)
            ScrollView(.vertical){
                LazyVStack(spacing: 12){
                    ForEach(listReminderViewModel.plantas, id: \.self){ planta in
                        ReminderCardView(delegate: self)
                            .environmentObject(ReminderCardViewModel(service: CoredataServices(), planta: planta))
                        
                    }
                }
                .onAppear(perform: {plantasFiltradas = listReminderViewModel.getPlants()})
            }
        }
    }
    
    func load() {
        plantasFiltradas = listReminderViewModel.getPlants()
    }
}
