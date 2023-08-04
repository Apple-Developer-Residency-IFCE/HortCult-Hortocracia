//
//  DicaSucessoView.swift
//  HortCult
//
//  Created by Victor Viana on 19/07/23.
//

import SwiftUI

struct DicaSucessoView: View {
    var body: some View {
        
        DicasView( imagemDica: Image("DicaSucesso"), tituloDica: "5 passos para ter uma horta de sucesso.", textoDica: Image("TextoSucesso"), fonteDica: "blog.plantei.com.br/5-passos-para-ter-sucesso-com-uma-horta-caseira/")
    }
}

struct DicaSucessoView_Previews: PreviewProvider {
    static var previews: some View {
        DicaSucessoView()
    }
}
