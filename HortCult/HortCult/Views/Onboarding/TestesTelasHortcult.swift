//
//  TestesTelasHortcult.swift
//  EstudandoSwift
//
//  Created by userext on 24/05/23.
//

import SwiftUI
struct TestesTelasHortcult: View {
    var body: some View {
        VStack{
            HortCultLogo()
            ImageSelectorView(ImageTrue: true, MainImage: "ImagensHort")
            TittleSelector(sizeSelector: false, textSelector: "Boas vindas!")
            Description(descriptionText: "Com o HortCult, você pode acompanhar a sua horta doméstica de forma simples e fácil.")
            ButtonSelector(buttonColor: true, symbolTrue: false, buttonText: "Iniciar")
            SecondButton(appearButton: true)
        }
            }
}

struct TestesTelasHortcult_Previews: PreviewProvider {
    static var previews: some View {
        TestesTelasHortcult()
    }
}
