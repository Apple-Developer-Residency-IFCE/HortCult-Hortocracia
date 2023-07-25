//
//  DicaSaudavelView.swift
//  HortCult
//
//  Created by Victor Viana on 19/07/23.
//

import SwiftUI

struct DicaSaudavelView: View {
    
    
    var body: some View {
        
        DicasView(imagemDica: Image("DicaSaudavel"), tituloDica: "Sua horta é saudável?", textoDica: Image("TextoSaudavel"), fonteDica: "plastprime.com/10-dicas-horta/")
    }
}

struct DicaSaudavelView_Previews: PreviewProvider {
    static var previews: some View {
        DicaSaudavelView()
    }
}
