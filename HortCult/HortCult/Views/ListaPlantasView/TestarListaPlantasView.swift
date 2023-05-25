//
//  TestarListaPlantasView.swift
//  HortCult
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct TestarListaPlantasView: View {
    
    @State var images: [String] = ["Logo_Clara","Logo_Escura","Home","Remover","Arrow-Left"]
    var body: some View {
        ListaPlantasView(images: $images)
    }
}

struct TestarListaPlantasView_Previews: PreviewProvider {
    static var previews: some View {
        TestarListaPlantasView()
    }
}
