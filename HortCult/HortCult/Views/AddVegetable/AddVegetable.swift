//
//  AddVegetable.swift
//  HortCult
//
//  Created by João Vitor Alves Holanda on 06/06/23.
//

import SwiftUI


struct AddVegetable: View {
    @AppStorage ("selectedTheme")private var selectedTheme: Choice?
    var plantViewModel: PlantViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewmodel: AddVegetableViewModel = AddVegetableViewModel()
    @StateObject private var imagesSelected = ImageSelected()

    
    
    var NavBar : some View {
        ZStack {
            Image(selectedTheme == .Escuro ? "Topbardark" : "Topbar")
            HStack {
                Button(action:{
                    self.presentationMode.wrappedValue.dismiss()
                } ) {
                    Image(selectedTheme == .Escuro ? "Arrow-Left-Light" : "Arrow-Left-Green")
                }
                .padding(.leading, 18)
                Spacer()
                    
            }
        }
        
    }
    
    var isFieldsFilled: Bool{
        return !viewmodel.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !viewmodel.description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && viewmodel.categoria != "Selecionar..." && viewmodel.frequencia != "Selecionar..."
    }
    
    var body: some View {
        
        NavigationView {
            ZStack{
                ScrollView(.vertical){
                    ZStack{
                        VStack{
                            AddEditTitle(addEdit: true)
                            NameDescription(nameVegetable: $viewmodel.name, descriptionVegetable: $viewmodel.description)
                            PickerCategoria(selectedOption: $viewmodel.categoria)
                            PickerFrequencia(selectedOption: $viewmodel.frequencia)
                            AddEditPhotos()
                                .environmentObject(imagesSelected)
                        }
                    }
                }
                .padding(.bottom, 100)
                
                Button(action: {
                    viewmodel.colorButton = "VerdeEscuro"
                    viewmodel.addVegetableAlert = true
                    viewmodel.discartVegetableAlert = true
                    if isFieldsFilled{
                        self.presentationMode.wrappedValue.dismiss()
                        if(viewmodel.frequencia == "Todos os dias"){
                            viewmodel.frequencia = "1"
                        }else if(viewmodel.frequencia == "A cada 2 dias"){
                            viewmodel.frequencia = "2"
                        }else if(viewmodel.frequencia == "A cada 4 dias"){
                            viewmodel.frequencia = "4"
                        }else{
                            viewmodel.frequencia = "7"
                        }
                        plantViewModel.createPlant(name: viewmodel.name, information: viewmodel.description, category: viewmodel.categoria, frequency: viewmodel.frequencia, image: imagesSelected.imagesSelected)
                    }
                    
                }) {
                    HStack {
                        Text("Adicionar Novo Vegetal")
                            .foregroundColor(Color("Branco"))
                            .font(Font.custom("Satoshi-Regular", size: 16))
                            .bold()
                    }
                    .foregroundColor(Color("CinzaClaro"))
                    
                    .frame(width: 350, height: 42)
                    .background(Color(isFieldsFilled ? "VerdeEscuro" : "CinzaClaro"))
                    .cornerRadius(40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color(isFieldsFilled ? "VerdeEscuro" : "CinzaClaro"), lineWidth: 2)
                    )
                }
                .disabled(!isFieldsFilled)
                .frame(alignment: .bottom)
                .padding(.top, 602)
            }
            
            
            
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavBar)
        
    }
    
}

struct AddVegetable_Previews: PreviewProvider {
    static var previews: some View {
        AddVegetable(plantViewModel: PlantViewModel())
    }
}
