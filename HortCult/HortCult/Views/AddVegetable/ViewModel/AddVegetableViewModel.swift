//
//  AddVegetableViewModel.swift
//  HortCult
//
//  Created by Victor Viana on 30/06/23.
//

import SwiftUI


class ImageSelected: ObservableObject{
    @Published var imagesSelected: [UIImage] = []
}


class AddVegetableViewModel: ObservableObject {
    @Published var colorButton: String
    @Published var addVegetableAlert: Bool
    @Published var discartVegetableAlert: Bool
    @Published var goToInformationViewAlert: Bool
    
    @Published var name : String
    @Published var description : String
    @Published var categoria : String
    @Published var frequencia : String
    @Published var isFull: Bool
    
    init() {
        self.colorButton = "CinzaClaro"
        self.addVegetableAlert = false
        self.discartVegetableAlert = false
        self.goToInformationViewAlert = false
        self.name = ""
        self.description = ""
        self.categoria = "Selecionar..."
        self.frequencia = "Selecionar..."
        self.isFull = false
    }
    
}
