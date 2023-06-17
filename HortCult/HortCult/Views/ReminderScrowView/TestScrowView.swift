//
//  TestScrowView.swift
//  HortCult
//
//  Created by Pedro Henrique Santos Rodrigues on 05/06/23.
//

import SwiftUI

struct TestScrowView: View {
    
    @ObservedObject var plantViewModel: PlantViewModel
    
    
    var body: some View {

        Button{
            plantViewModel.createPlant(name: "", information: "", category: "", frequency: "2", image: Data())
            
        } label: {
            Text("Clica")
        }
        
    }
}

struct TestScrowView_Previews: PreviewProvider {
    static var previews: some View {
        TestScrowView(plantViewModel: PlantViewModel())
    }
}
