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
                    NavigationLink(destination: TabBar(plantViewModel: PlantViewModel()), isActive: $showOnboarding) {
                        EmptyView()
                    }
                    Button(action: {
                        showOnboarding = true
                        HortCultApp.isFirstLogin = false
                    }) {
                        HStack {
                            Text("Ir para a Tela Inicial")
                            Image("Arrow-Right")
                                .renderingMode(.template)
                        }
                        .foregroundColor(Color("TextOn14"))
                        .padding()
                        .frame(width: 277, height: 42)
                        .background(Color("TextOn23"))
                        .cornerRadius(40)
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
