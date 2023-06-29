//
//  Onboarding02.swift
//  HortCult
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct Onboarding02: View {
    @State private var showOnboarding = false
    @State private var moveToHome = false
    @Environment(\.colorScheme) var colorScheme
    @AppStorage ("isFirstLogin") static var isFirstLogin: Bool = true
    var body: some View {
        NavigationView {
            VStack{
                HortCultLogo()
                ImageSelectorView(ImageTrue: true, MainImage: "onboarding02")
                TittleSelector(sizeSelector: false, textSelector: "Acompanhe a sua horta")
                Description(descriptionText: "Tenha uma visão geral do desenvolvimento das suas plantações.")
                VStack{
                    NavigationLink(destination: Onboarding03(), isActive: $showOnboarding) {
                        EmptyView()
                    }
                    Button(action: {
                        showOnboarding = true
                    }) {
                        HStack {
                            Text("Continuar")
                                .font(Font.custom("Satoshi-Regular", size: 16))
                            Image(colorScheme == .dark ? "Arrow-Right-GreenLight" : "Arrow-Right-Green")
                                .foregroundColor(Color("Branco"))
                        }
                        .foregroundColor(Color("VerdeEscuro"))
                        .padding()
                        .frame(width: 277, height: 42)
                        .background(Color("Branco"))
                        .cornerRadius(40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color("VerdeEscuro"), lineWidth: 2)
                        )
                    }
                }
                VStack {
                    NavigationLink(destination: TabBar(plantViewModel: PlantViewModel()), isActive: $moveToHome) {
                        EmptyView()
                    }
                    Button(action: {
                        HortCultApp.isFirstLogin = false
                        moveToHome = true
                    }) {
                        Text("Pular para a Tela inicial")
                            .font(Font.custom("Satoshi-Regular", size: 16))
                            .foregroundColor(Color("Cinza"))
                    }
                    .background(Color("Branco"))
                    .padding(.top, 28)
                }
                .padding(.bottom, 20)

            }.navigationBarBackButtonHidden(true)
        }.navigationBarBackButtonHidden(true)
    }
}

struct Onboarding02_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding02()
    }
}
