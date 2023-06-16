//
//  ListaPlantasView.swift
//  HortCult
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct ListaPlantasView: View {
    
    @Binding var images: [String]
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        
        VStack(spacing: 20){
            HStack(spacing: 170.0){
                Text("Minha Horta")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("VerdeEscuro"))
                    .padding(.leading, 5)
                NavigationLink {
                    AddVegetable()
                } label: {
                    HStack {
                        Image(colorScheme == .dark ? "Add" : "AddWhite")
                            .frame(width: 32, height: 32)
                            .background(Color("VerdeEscuro"))
                            .cornerRadius(50)
                    }
                }
                
            }
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 12) {
                    ForEach(images, id: \.self) { imageName in
                        NavigationLink(destination: InformationView()){
                            VStack{
                                Image(imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxHeight: 115)
                                    .clipped()
                                Text(imageName)
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
            .padding(.leading, 20.0)
            .frame(maxHeight: 150)
        }
    }
    
    struct ListaPlantasView_Previews: PreviewProvider {
        static var previews: some View {
            ListaPlantasView(images: .constant([]))
        }
    }
}
