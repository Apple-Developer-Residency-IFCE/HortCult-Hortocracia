//
//  SucessoView.swift
//  HortCult
//
//  Created by Victor Viana on 19/07/23.
//

import SwiftUI

struct SucessoView: View {
    var body: some View {
        
        VStack{
            
            ScrollView(.vertical){
                VStack(alignment: .leading){
                    Image("DicaSucesso")
                        .resizable()
                        .frame(width: 390, height: 207)
                    
                    Text("5 passos para ter uma horta de sucesso")
                        .font(Font.custom("Satoshi-Medium", size: 24))
                        .foregroundColor(Color("VerdeEscuro"))
                    
                }
                
            }
        }
    }
}

  


struct SucessoView_Previews: PreviewProvider {
    static var previews: some View {
        SucessoView()
    }
}
