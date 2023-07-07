//
//  EditPlantView.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 05/07/23.
//

import SwiftUI

struct EditPlantView: View {
    @EnvironmentObject var editViewModel: EditPlantViewModel
    @AppStorage ("selectedTheme")private var selectedTheme: Choice?
    
    var isFieldsFilled: Bool{
        return editViewModel.plantName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && editViewModel.plantInformation.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && editViewModel.plantCategory != "Selecionar..." && editViewModel.plantFrequency != "Selecionar..."
        }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var load: () -> Void
    
    var Title: some View {
        HStack{
            Text("Editar Vegetal")
                .font(.title)
                .font(Font.custom("Satoshi-Bold", size: 28))
                .fontWeight(.bold)
                .foregroundColor(Color("VerdeEscuro"))
                .padding(.top, 20)
        }
    }
    
    var NavBar : some View {
        ZStack {
            HeaderLogo()
                .frame(minWidth: 400, minHeight: 200)
                .padding(.top,-40)
            HStack {
                Button(action:{
                    self.presentationMode.wrappedValue.dismiss()
                } ) {
                    Image(selectedTheme == .Escuro ? "Arrow-Left-Light" : "Arrow-Left-Green")
                }
                .padding(.leading, 18)
            }
            .padding(.leading,-190)
        }
    }

    var body: some View {

        NavigationView {
            ZStack{
                ScrollView(.vertical){

                    ZStack{
                        VStack(alignment: .leading, spacing: 10){
                            Title
                            NameInput(namePlant: $editViewModel.plantName)
                            DescriptionInput(descriptionVegetable: $editViewModel.plantInformation)
                            CategoryPicker(selectedOption: $editViewModel.plantCategory)
                            FrequencyPicker(selectedOption: $editViewModel.plantFrequency)
                            ImagePicker(selectedPhotosData: $editViewModel.plantImage)
                            Spacer(minLength: 80)
                        }
                        .padding(.horizontal, 40)
                    }
                }
                Spacer()



                VStack{
                    Spacer()

                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                        editViewModel.updatePlant()
                        load()
                    }) {
                        HStack {
                            Text("Adicionar Novo Vegetal")
                                .foregroundColor(Color("Branco"))
                                .font(.system(size: 16))
                                .bold()
                        }
                        .foregroundColor(Color("CinzaClaro"))

                        .frame(width: 350, height: 42)
                        .background(Color(isFieldsFilled ? "VerdeEscuro" : "CinzaClaro"))
                        .cornerRadius(40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color(isFieldsFilled  ? "VerdeEscuro" : "CinzaClaro"), lineWidth: 2)
                        )
                    }
                    .disabled(isFieldsFilled )
                    .frame(alignment: .bottom)
                    .padding(.bottom, 60)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavBar)

    }
}
