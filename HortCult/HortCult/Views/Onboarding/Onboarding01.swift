//
//  Onboarding01.swift
//  HortCult
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct Onboarding01: View {
    var body: some View {
        VStack{
            HortCultLogo()
            Spacer()
            ImageSelectorView(ImageTrue: false, MainImage: "ImagensHort")
            TittleSelector(sizeSelector: true, textSelector: "Boas vindas!")
            Description(descriptionText: "Com o HortCult, você pode acompanhar a sua horta doméstica de forma simples e fácil.")
            ButtonSelector(buttonColor: true, symbolTrue: false, buttonText: "Iniciar")
            SecondButton(appearButton: false)
        }
    }
}

struct Onboarding01_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding01()
    }
}
