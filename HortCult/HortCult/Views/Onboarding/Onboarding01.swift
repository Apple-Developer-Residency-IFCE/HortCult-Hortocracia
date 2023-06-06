//
//  Onboarding01.swift
//  HortCult
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct Onboarding01: View {
    @State private var showOnboarding = false
    var body: some View {
        NavigationView{

        VStack{
            HortCultLogo()
            ImageSelectorView(ImageTrue: false, MainImage: "ImagensHort")
            TittleSelector(sizeSelector: true, textSelector: "Boas vindas!")
            Description(descriptionText: "Com o HortCult, você pode acompanhar a sua horta doméstica de forma simples e fácil.")
            Spacer()
                VStack{
                    NavigationLink(destination: Onboarding02(), isActive: $showOnboarding) {
                        EmptyView()
                    }
                    Button(action: {
                        showOnboarding = true
                    }) {
                        HStack {
                            Text("Iniciar")
                        }
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 277, height: 42)
                        .background(Color("H1Color"))
                        .cornerRadius(40)
                    }
                }.padding(.bottom, 45)
            }
        }.navigationBarBackButtonHidden(true)
        
    }
}


struct Onboarding01_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding01()
    }
}
