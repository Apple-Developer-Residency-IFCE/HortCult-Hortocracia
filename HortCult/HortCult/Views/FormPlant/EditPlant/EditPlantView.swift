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
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.dismiss) private var dismiss
    
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
                        editViewModel.updatePlant()
                        load()
                        dismiss()
                    }) {
                        HStack {
                            Text("Salvar Alterações")
                                .foregroundColor(Color("Branco"))
                                .font(.system(size: 16))
                                .bold()
                        }
                        .foregroundColor(Color("CinzaClaro"))

                        .frame(width: 350, height: 42)
                        .background(Color(editViewModel.isEditButtonAble ? "VerdeEscuro" : "CinzaClaro"))
                        .cornerRadius(40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color(editViewModel.isEditButtonAble  ? "VerdeEscuro" : "CinzaClaro"), lineWidth: 2)
                        )
                    }
                    .disabled(!editViewModel.isEditButtonAble)
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