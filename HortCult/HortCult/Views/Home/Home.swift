//
//  Home.swift
//  HortCult
//
//  Created by João Vitor Alves Holanda on 06/06/23.
//

import SwiftUI

struct Home: View {
    @State var images: [String] = ["Tomatinho","Abobrinha","Tomatinho2","Abobrinha2"]
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical){
                ListaPlantasView(images: $images)
                    .padding(.top, 20)
                ScrollViewWithHeader(plantViewModel: PlantViewModel())
            }.toolbar(){
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(colorScheme == .dark ? "Topbardark" : "Topbar")
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
