//
//  AddPlantView.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 05/07/23.
//

import SwiftUI

struct AddPlantView: View {
    @EnvironmentObject var addViewModel: AddPlantViewModel
    @AppStorage ("selectedTheme")private var selectedTheme: Choice?
    
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var load: () -> Void
    
    var Title: some View {
        HStack{
            Text("Adicionar Vegetal")
                .font(.title)
                .font(Font.custom("Satoshi-Bold", size: 28))
                .fontWeight(.bold)
                .foregroundColor(Color("VerdeEscuro"))
                .padding(.top, 20)
                .padding(.leading, 20)
        }
    }
    
    var NavBar : some View {
        ZStack {
            HeaderLogo()
                .frame(minWidth: 400, minHeight: 200)
                .padding(.top,-40)
            HStack {
                Button(action:{
                    addViewModel.resetFields()
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
                            NameInput(namePlant: $addViewModel.plantName)
                            DescriptionInput(descriptionVegetable: $addViewModel.plantInformation)
                            CategoryPicker(selectedOption: $addViewModel.plantCategory)
                            FrequencyPicker(selectedOption: $addViewModel.plantFrequency)
                            ImagePickerView(selectedPhotosData: $addViewModel.plantImage)
                            Spacer(minLength: 80)
                        }
                        
                    }
                    
                }
                Spacer()



                VStack{
                    Spacer()

                    Button(action: {
                        addViewModel.addPlant()
                        load()
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Text("Adicionar Novo Vegetal")
                                .foregroundColor(Color("Branco"))
                                .font(.system(size: 16))
                                .bold()
                        }
                        .foregroundColor(Color("CinzaClaro"))

                        .frame(width: 350, height: 42)
                        .background(Color(addViewModel.isAddButtonAble ? "VerdeEscuro" : "CinzaClaro"))
                        .cornerRadius(40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color(addViewModel.isAddButtonAble  ? "VerdeEscuro" : "CinzaClaro"), lineWidth: 2)
                        )
                    }
                    .disabled(!addViewModel.isAddButtonAble)
                    .frame(alignment: .bottom)
                    .padding(.bottom, 20)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavBar)

    }
}

struct AddPlant_Previews: PreviewProvider {
    static var previews: some View {
        AddPlantView(load: {})
            .environmentObject(AddPlantViewModel(service: CoredataServices()))
    }
}
