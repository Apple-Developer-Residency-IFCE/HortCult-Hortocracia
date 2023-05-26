//
//  Onboarding02.swift
//  HortCult
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct Onboarding02: View {
    var body: some View {
        VStack{
            HortCultLogo()
            ImageSelectorView(ImageTrue: true, MainImage: "onboarding1")
            TittleSelector(sizeSelector: false, textSelector: "Acompanhe a sua horta")
            Description(descriptionText: "Tenha uma visão geral do desenvolvimento das suas plantações.")
            ButtonSelector(buttonColor: false, symbolTrue: true, buttonText: "Continuar")
            SecondButton(appearButton: true)
        }
    }
}

struct Onboarding02_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding02()
    }
}
