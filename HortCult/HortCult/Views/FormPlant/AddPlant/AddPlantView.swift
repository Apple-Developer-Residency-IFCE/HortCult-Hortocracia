//
//  AddPlantView.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 05/07/23.
//

import SwiftUI

struct AddPlantView: View {
    @EnvironmentObject var viewModel: AddPlantViewModel
    var load: () -> Void
    
    var body: some View {
        VStack {
            TextField("Enter name", text: $viewModel.plantName)
            TextField("Enter information", text: $viewModel.plantInformation)
            TextField("Enter category", text: $viewModel.plantCategory)
            TextField("Enter frequency", text: $viewModel.plantFrequency)
            DatePicker("Select next date", selection: $viewModel.plantNextDate, displayedComponents: .date)
            Button(action: {
                viewModel.addPlant()
                load()
            }) {
                Text("Add Plant")
            }
        }
        .padding()
    }
}
