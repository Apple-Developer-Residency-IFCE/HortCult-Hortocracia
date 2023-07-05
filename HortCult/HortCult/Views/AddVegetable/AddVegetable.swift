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
                
                VStack{
                    Spacer()
                    
                    Button(action: {
                        // Só um teste
                        viewmodel.colorButton = "VerdeEscuro"
                        viewmodel.addVegetableAlert = true
                        viewmodel.discartVegetableAlert = true
                        if isFieldsFilled{
                            self.presentationMode.wrappedValue.dismiss()
                            plantViewModel.createPlant(name: viewmodel.name,
                                                       information: viewmodel.description,
                                                       category: viewmodel.categoria,
                                                       frequency: viewmodel.frequencia,
                                                       image: imagesSelected.imagesSelected)
                        }
                        
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
                                .stroke(Color(isFieldsFilled ? "VerdeEscuro" : "CinzaClaro"), lineWidth: 2)
                        )
                    }
                    .disabled(!isFieldsFilled)
                    .frame(alignment: .bottom)
                    .padding(.bottom, 60)
                }
                
//
                
//                .alert(isPresented: $addVegetableAlert) {
//                    Alert(
//                        title: Text("Planta cadastrada!"),
//                        message: Text("Você pode ver sua planta diretamente na tela inicial, em \"Minha Horta\""),
//                        primaryButton: .default(Text("Tela Inicial")),
//                        secondaryButton: .default(
//                            Text("Ver Planta")
//                                .foregroundColor(Color("Cinza"))
//                        )
//                    )
//
//                }
                //descartar a criacao da planta
//                .alert(isPresented: $discartVegetableAlert) {
//                    Alert(
//                        title: Text("Deseja descartar a criação da sua planta?"),
//                        message: Text("Essa ação não poderá ser desfeita."),
//                        primaryButton: .cancel(Text("Cancelar")),
//                        secondaryButton: .default(
//                            Text("Descartar")
//                        )
//                    )
//
//                }
            }
            
            
            
        }
//        .edgesIgnoringSafeArea(.all)
//        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(leading: NavBar)
        
    }
    
}

struct AddVegetable_Previews: PreviewProvider {
    static var previews: some View {
        AddVegetable(plantViewModel: PlantViewModel())
    }
}
