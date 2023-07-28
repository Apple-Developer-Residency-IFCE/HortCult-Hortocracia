//
//  TesteDeAnimacoes.swift
//  HortCult
//
//  Created by Pedro Henrique Santos Rodrigues on 26/07/23.
//

import SwiftUI

struct TesteDeAnimacoes: View {
    
    @State private var position: CGPoint = .zero
    
    var body: some View {
        Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
                    .position(position)
                    .onTapGesture {
                        // Gerar coordenadas aleatórias
                        let randomX = CGFloat.random(in: 0...UIScreen.main.bounds.width - 50)
                        let randomY = CGFloat.random(in: 0...UIScreen.main.bounds.height - 50)

                        // Atualizar a posição do elemento
                        self.position = CGPoint(x: randomX, y: randomY)
                    }
    }
}

struct TesteDeAnimacoes_Previews: PreviewProvider {
    static var previews: some View {
        TesteDeAnimacoes()
    }
}
