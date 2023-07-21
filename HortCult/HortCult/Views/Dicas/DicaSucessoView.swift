//
//  DicaSucessoView.swift
//  HortCult
//
//  Created by Victor Viana on 19/07/23.
//

import SwiftUI

struct DicaSucessoView: View {
    
    @Binding var showingSheet: Bool
    
    var body: some View {
        
        DicasView(showingSheet: $showingSheet, imagemDica: Image("DicaSucesso"), tituloDica: "5 passos para ter uma horta de sucesso.", textoDica: Image("TextoSucesso"), fonteDica: "blog.plantei.com")
    }
}

struct DicaSucessoView_Previews: PreviewProvider {
    static var previews: some View {
        DicaSucessoView(showingSheet: .constant(true))
    }
}
