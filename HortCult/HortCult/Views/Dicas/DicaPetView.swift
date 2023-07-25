//
//  DicaPetView.swift
//  HortCult
//
//  Created by Victor Viana on 19/07/23.
//

import SwiftUI

struct DicaPetView: View {
    
    
    var body: some View {
        
        DicasView(imagemDica: Image("DicaPet"), tituloDica: "Horta para pets: O que\nplantar para cães, gatos e calopsitas.", textoDica: Image("TextoPet"), fonteDica: "blog.plantei.com.br/horta-para-pets/")
    }
}

struct DicaPetView_Previews: PreviewProvider {
    static var previews: some View {
        DicaPetView()
    }
}
