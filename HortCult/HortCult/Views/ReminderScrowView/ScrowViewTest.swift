//
//  ScrowView.swift
//  HortCult
//
//  Created by Pedro Henrique Santos Rodrigues on 05/06/23.
//

import SwiftUI

struct ScrowView: View {
    var body: some View {
        ZStack{
            ScrollView(.vertical){
                LazyVStack(spacing: 12){
                    ReminderCardView(imagem: "Rega", titulo: "Batatão está com sede!", descricao: "De agua para sua plantinha", cardColor:"LembreteRega", circleColor: "LembreteCircleRega")
                    ReminderCardView(imagem: "Rega", titulo: "Batatão está com sede!", descricao: "De agua para sua plantinha", cardColor:"LembreteRega", circleColor: "LembreteCircleRega")
                    ReminderCardView(imagem: "Rega", titulo: "Batatão está com sede!", descricao: "De agua para sua plantinha", cardColor:"LembreteRega", circleColor: "LembreteCircleRega")
                    
                }
            }
        }
    }
}

struct ScrowView_Previews: PreviewProvider {
    static var previews: some View {
        ScrowView()
    }
}
