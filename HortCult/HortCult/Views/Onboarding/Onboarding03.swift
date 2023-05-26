//
//  Onboarding03.swift
//  HortCult
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct Onboarding03: View {
    var body: some View {
        VStack{
            HortCultLogo()
            ImageSelectorView(ImageTrue: true, MainImage: "onboarding2")
            TittleSelector(sizeSelector: true, textSelector: "Amplie sua horta com diferen")
            Description(descriptionText: "Com o HortCult, você pode acompanhar a sua horta doméstica de forma simples e fácil.")
            ButtonSelector(buttonColor: true, symbolTrue: false, buttonText: "Iniciar")
            SecondButton(appearButton: false)
        }
    }
}

struct Onboarding03_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding03()
    }
}
