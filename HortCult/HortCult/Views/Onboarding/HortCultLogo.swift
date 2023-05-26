//
//  HortCultLogo.swift
//  EstudandoSwift
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct HortCultLogo: View {
    var body: some View {
        Image("Logo_Clara")
            .resizable()
            .frame(width: 174, height: 32)
            .padding(.bottom, 98)
            Spacer()
        
        //scale fill, cover, fit,
    }
}

struct HortCultLogo_Previews: PreviewProvider {
    static var previews: some View {
        HortCultLogo()
    }
}
