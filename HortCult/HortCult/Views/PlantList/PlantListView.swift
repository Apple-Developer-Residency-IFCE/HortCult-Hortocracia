//
//  ListaPlantasView.swift
//  HortCult
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct ListaPlantasView: View {
    @EnvironmentObject var plantListViewModel: PlantListViewModel
    let addViewModel = AddPlantViewModel(service: CoredataServices())
    @Environment(\.colorScheme) var colorScheme
    let coreDataService:CoredataServices = CoredataServices()
    var body: some View {
        
        VStack(spacing: 20){
            HStack{
                Text("Minha Horta")
                    .font(Font.custom("Satoshi-Bold", size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(Color("VerdeEscuro"))
                    .padding(.leading, 5)
                Spacer()
                NavigationLink {
                    AddPlantView() {
                        plantListViewModel.loadPlants()
                    }
                        .environmentObject(addViewModel)
                } label: {
                    HStack {
                        Image(colorScheme == .dark ? "Add" : "AddWhite")
                            .frame(width: 32, height: 32)
                            .background(Color("VerdeEscuro"))
                            .cornerRadius(50)
                    }
                }
                
            }.padding(.horizontal, 20)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 12) {
                    ForEach(plantListViewModel.plantsModel, id: \.self) { planta in
        
                        NavigationLink(destination: InformationView(
                            editPlant: EditPlantViewModel(
                                service: coreDataService,
                                planta: planta),
                            cardProxRega: CardProxRegaViewModel(
                                service: coreDataService,
                                planta: planta),
                            imageListViewModel: ImageListViewModel(
                                service: coreDataService,
                                planta: planta))
                            .environmentObject(InformationViewModel(
                                service: coreDataService,
                                planta: planta)
                            )
                        ){
                            VStack{
                                Image(uiImage: plantListViewModel.dataToUIImage(planta: planta))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxHeight: 115)
                                    .clipped()
                                
                                Text(planta.name)
                                    .font(Font.custom("Satoshi-Regular", size: 16))
                                    .foregroundColor(Color("CinzaEscuro"))
                                    .padding(.bottom, 9)
                            }.frame(width: 140, height: 150)
                                .background(Color("BrancoMinhaHorta"))
                                .cornerRadius(12)
                        }
                    }
                }
            }
            .onAppear(perform: plantListViewModel.loadPlants)
            .padding(.leading, 20)
            .frame(maxHeight: 150)
        }
    }
    
}
