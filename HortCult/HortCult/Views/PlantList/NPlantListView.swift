//
//  NPlantListView.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 05/07/23.
//

import SwiftUI

struct PlantListView: View {
    @EnvironmentObject var viewModel: PlantListViewModel
    let addViewModel = AddPlantViewModel(service: CoredataServices())
    
    var body: some View {
        VStack{
            AddPlantView() {viewModel.loadPlants()}
                .environmentObject(addViewModel)
            Text("Plantas")
            LazyVGrid(columns: [.init(.flexible()),.init(.flexible())])  {
                ForEach(viewModel.plants, id: \.id) { plant in
                    VStack{
                        Text(plant.name ?? "")
                    }
                }
            }
        }
    }
}

//struct PlantListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlantListView()
//    }
//}
