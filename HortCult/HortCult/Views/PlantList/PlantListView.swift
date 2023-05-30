//
//  ListaPlantasView.swift
//  HortCult
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct ListaPlantasView: View {

    @Binding var images: [String]

    var body: some View {
        VStack(spacing: 20){
            HStack(spacing: 170.0){
                Text("Minha Horta")
                    .font(Font.custom("Satoshi-Black", size: 28))
                    .foregroundColor(Color("VerdeEscuro"))

                Button {
                    //Action do botão
                } label: {
                    Image("Add")
                }
                .frame(width: 32, height: 32)
                .background(Color("VerdeEscuro"))
                .cornerRadius(40)
            }

            ScrollView(.horizontal) {
                LazyHStack(spacing: 12) {
                    ForEach(images, id: \.self) { imageName in
                        VStack(spacing: 0){

                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 140,height: 110)
                            Text(imageName)
                                .font(Font.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color("CinzaEscuro"))
                        }.background(Color("BrancoMinhaHorta"))
                        .cornerRadius(12)

                    }
                }
            }.padding(.leading, 20.0).frame(maxHeight: 150)




        }

    }
    struct ListaPlantasView_Previews: PreviewProvider {
        static var previews: some View {
            ListaPlantasView(images: .constant([]))
        }
    }
}
