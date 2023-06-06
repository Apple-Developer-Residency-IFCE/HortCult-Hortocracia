//
//  TestScrowView.swift
//  HortCult
//
//  Created by Pedro Henrique Santos Rodrigues on 05/06/23.
//

import SwiftUI

struct TestScrowView: View {
    var body: some View {
        @State var cards : [AnyView] = [
            AnyView(ReminderCardView(imagem: "Rega", titulo: "Batatão está com sede!", descricao: "De agua para sua plantinha", cardColor:"LembreteRega", circleColor: "LembreteCircleRega")),
            AnyView(ReminderCardView(imagem: "Rega", titulo: "Batatão está com sede!", descricao: "De agua para sua plantinha", cardColor:"LembreteRega", circleColor: "LembreteCircleRega")),
            
        ]
    }
}

