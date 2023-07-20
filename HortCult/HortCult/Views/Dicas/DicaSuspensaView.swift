//
//  DicaSuspensaView.swift
//  HortCult
//
//  Created by Victor Viana on 19/07/23.
//

import SwiftUI

struct DicaSuspensaView: View {
    
    @Binding var showingSheet: Bool
    
    var body: some View {
        
        DicasView(showingSheet: $showingSheet, imagemDica: Image("DicaSuspensa"), tituloDica: "Como fazer uma horta\nsuspensa?", textoDica: Image("TextoSuspensa"), fonteDica: "blog.plantei.com")
    }
}

struct DicaSuspensaView_Previews: PreviewProvider {
    static var previews: some View {
        DicaSuspensaView(showingSheet: .constant(true))
    }
}
