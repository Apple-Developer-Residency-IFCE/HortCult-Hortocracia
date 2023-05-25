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
        ScrollView(.horizontal) {
            LazyHStack(spacing: 30) {
                ForEach(images, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
                }
            }
            .padding()
        }
        
    }
    
    struct ListaPlantasView_Previews: PreviewProvider {
        static var previews: some View {
            ListaPlantasView(images: .constant([]))
        }
    }
}
