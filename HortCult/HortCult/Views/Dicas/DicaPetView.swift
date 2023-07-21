//
//  DicaPetView.swift
//  HortCult
//
//  Created by Victor Viana on 19/07/23.
//

import SwiftUI

struct DicaPetView: View {
    
    @Binding var showingSheet: Bool
    
    var body: some View {
        
        DicasView(showingSheet: $showingSheet, imagemDica: Image("DicaPet"), tituloDica: "Horta para pets: O que\nplantar para cães, gatos e calopsitas.", textoDica: Image("TextoPet"), fonteDica: "blog.plantei.com")
    }
}

struct DicaPetView_Previews: PreviewProvider {
    static var previews: some View {
        DicaPetView(showingSheet: .constant(true))
    }
}
