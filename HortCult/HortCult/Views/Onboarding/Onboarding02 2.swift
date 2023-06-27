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
                            Image("Arrow-Right")
                                .foregroundColor(.white)
                        }
                        .foregroundColor(Color("H1Color"))
                        .padding()
                        .frame(width: 277, height: 42)
                        .background(.white)
                        .cornerRadius(40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color("H1Color"), lineWidth: 2)
                        )
                    }
                }
                VStack {
                    NavigationLink(destination: TabBar(plantViewModel: PlantViewModel()), isActive: $moveToHome) {
                        EmptyView()
                    }
                    Button(action: {
                        moveToHome = true
                    }) {
                        Text("Pular para a Tela inicial")
                            .foregroundColor(Color("H4Color"))
                    }
                    .background(.white)
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
