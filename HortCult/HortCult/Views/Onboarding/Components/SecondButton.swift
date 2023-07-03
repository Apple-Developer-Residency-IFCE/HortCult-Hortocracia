//
//  SecondButton.swift
//  EstudandoSwift
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct SecondButton: View {
    var appearButton: Bool
    var body: some View {
        if appearButton{
            Button(action: {
                //print(buttonText)
            }) {
                Text("Pular para a Tela inicial")
                    .font(Font.custom("Satoshi-Regular", size: 16))
                    .foregroundColor(Color("H4Color"))
            }
            .background(.white)
            //.padding(.top, 15)
            //.padding(.bottom, 30)
            Spacer()
        }else{
            Spacer()
            EmptyView()
        }
    }
}
