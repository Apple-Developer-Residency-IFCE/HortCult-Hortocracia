//
//  Onboarding04.swift
//  HortCult
//
//  Created by userext on 26/05/23.
//

import SwiftUI

struct Onboarding04: View {
    @State private var showOnboarding = false
    var body: some View {
        NavigationView {
            VStack{
                HortCultLogo()
                ImageSelectorView(ImageTrue: true, MainImage: "onboarding04")
                TittleSelector(sizeSelector: true, textSelector: "Hora de Cuidar")
                Description(descriptionText: "Receba lembretes para regar e adubar suas lantas na frequência certa.")
                VStack{
                    NavigationLink(destination: TestePseudoHome(), isActive: $showOnboarding) {
                        EmptyView()
                    }
                    Button(action: {
                        showOnboarding = true
                        HortCultApp.isFirstLogin = false
                    }) {
                        HStack {
                            Text("Ir para a Tela Inicial")
                            Image("Arrow-Right")
                                .foregroundColor(.white)
                        }
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 277, height: 42)
                        .background(Color("H1Color"))
                        .cornerRadius(40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color("H1Color"), lineWidth: 2)
                        )
                    }
                }
                SecondButton(appearButton: false)
            }.navigationBarBackButtonHidden(true)
        }.navigationBarBackButtonHidden(true)
    }
}

struct Onboarding04_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding04()
    }
}
