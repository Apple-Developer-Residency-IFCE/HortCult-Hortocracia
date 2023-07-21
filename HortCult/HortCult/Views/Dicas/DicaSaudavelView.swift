//
//  DicaSaudavelView.swift
//  HortCult
//
//  Created by Victor Viana on 19/07/23.
//

import SwiftUI

struct DicaSaudavelView: View {
    
    @Binding var showingSheet: Bool
    
    var body: some View {
        
        DicasView(showingSheet: $showingSheet, imagemDica: Image("DicaSaudavel"), tituloDica: "Sua horta é saudável?", textoDica: Image("TextoSaudavel"), fonteDica: "plastprime.com")
    }
}

struct DicaSaudavelView_Previews: PreviewProvider {
    static var previews: some View {
        DicaSaudavelView(showingSheet: .constant(true))
    }
}
