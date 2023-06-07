//
//  TestarListaPlantasView.swift
//  HortCult
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct TestarListaPlantasView: View {

    @State var images: [String] = ["Tomatinho","Abobrinha","Tomatinho2","Abobrinha2"]
    var body: some View {
        VStack{
            ListaPlantasView(images: $images)
        }

    }   
}

struct TestarListaPlantasView_Previews: PreviewProvider {
    static var previews: some View {
        TestarListaPlantasView()
    }
}
