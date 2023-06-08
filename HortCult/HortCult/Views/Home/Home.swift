//
//  Home.swift
//  HortCult
//
//  Created by João Vitor Alves Holanda on 06/06/23.
//

import SwiftUI

struct Home: View {
    @State var images: [String] = ["Tomatinho","Abobrinha","Tomatinho2","Abobrinha2"]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical){
                ListaPlantasView(images: $images)
                    .padding(.top, 20)
                ScrollViewWithHeader()
            }.toolbar(){
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("Topbar")
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


//@State var images: [String] = ["Tomatinho","Abobrinha","Tomatinho2","Abobrinha2"]
//var body: some View {
//    VStack{
//
//        ListaPlantasView(images: $images)
//    }
//
//}
