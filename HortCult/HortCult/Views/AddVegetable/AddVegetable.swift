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
    var minhahorta = "Minha Horta"
    @State private var colorButton: String = "CinzaClaro"
    @State private var addVegetableAlert = false
    @State private var discartVegetableAlert = false
    @State private var goToInformationViewAlert = false
    @State private var shouldNavigateButton = false
    @State private var name : String = ""
    @State private var description : String = ""
    @State private var categoria : String = "Selecionar..."
    @State private var frequencia : String = "Selecionar..."
    @State private var isFull: Bool = false
    @State private var showOverlay = false
    @State var isSheeting: Bool = false
    
    
    func navegarParaPlanta(){
        
    }
    
    
    var NavBar : some View {
        ZStack {
            Image(selectedTheme == .Escuro ? "Topbardark" : "Topbar")
            HStack {
                Button(action:{
                    if isFieldsAllFilled {
                        discartVegetableAlert = true
                    }else{
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    
                } ) {
                    Image(selectedTheme == .Escuro ? "Arrow-Left-Light" : "Arrow-Left-Green")
                }
                .padding(.leading, 18)
                Spacer()
                
            }
            if showOverlay {
                Color.black.opacity(0.1)
                    .edgesIgnoringSafeArea(.all)
                    .zIndex(0)
            }
        }
        
    }
    var isFieldsFilled: Bool{
        return !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && categoria != "Selecionar..." && frequencia != "Selecionar..."
    }
    var isFieldsAllFilled: Bool{
        return !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || !description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || categoria != "Selecionar..." || frequencia != "Selecionar..."
    }
    
    var body: some View {
        
        NavigationView {
            ZStack{
                ScrollView(.vertical){
                    ZStack{
                        VStack{
                            AddEditTitle(addEdit: true)
                            NameDescription(nameVegetable: $name, descriptionVegetable: $description)
                            PickerCategoria(selectedOption: $categoria)
                            PickerFrequencia(selectedOption: $frequencia)
                            AddEditPhotos()
                            
                            
                        }
                        
                    }
                }
                .padding(.bottom, 100)
                if showOverlay {
                    Color.black.opacity(0.1)
                        .edgesIgnoringSafeArea(.all)
                        .zIndex(0)
                }

                Button(action: {
                    colorButton = "VerdeEscuro"
                    addVegetableAlert = true
                    if isFieldsFilled{
                        if(frequencia == "Todos os dias"){
                            frequencia = "1"
                        }else if(frequencia == "A cada 2 dias"){
                            frequencia = "2"
                        }else if(frequencia == "A cada 4 dias"){
                            frequencia = "4"
                        }else{
                            frequencia = "7"
                        }
                        plantViewModel.createPlant(name: name, information: description, category: categoria, frequency: frequencia, image: UIImage())                    }
                    
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
                .padding(.top, 602)
                if addVegetableAlert{
                    VStack{
                        CustomAlert(
                            title: "Planta cadastrada!",
                            message: "Vocë pode ver sua planta diferetamente na tela inicial, em \"Minha Horta\"",
                            primaryButtonTitle: "Ver planta",
                            primaryButtonAction: {
                                self.isSheeting = true
                                self.presentationMode.wrappedValue.dismiss()
                            },
                            secondaryButtonTitle: "Tela inicial",
                            secondaryButtonAction: {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                            
                            
                        ).padding(.top, 50)
                    }.frame(width: 300, height: 100)
                        .zIndex(1)
                        .onAppear {
                            showOverlay = true
                        }
                }
                if discartVegetableAlert{
                    VStack{
                        CustomAlert(
                            title: "Deseja descartar a criação da sua planta ?",
                            message: "Essa ação não poderá ser desfeita",
                            primaryButtonTitle: "Descartar",
                            primaryButtonAction: {
                                self.presentationMode.wrappedValue.dismiss()
                            },
                            secondaryButtonTitle: "Cancelar",
                            secondaryButtonAction: {
                                discartVegetableAlert = false
                                showOverlay = false
                            }
                            
                            
                        ).padding(.top, 50)
                    }.frame(width: 300, height: 100)
                        .zIndex(1)
                        .onAppear {
                            showOverlay = true
                        }
                }
            }
            
            
            
            
            
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavBar)
        .sheet(isPresented: self.$isSheeting, content: {
            AlertInformationView(planta: plantViewModel.getPlant(by: self.name)!)
        })
        
        
    }
    
}

struct AddVegetable_Previews: PreviewProvider {
    static var previews: some View {
        AddVegetable(plantViewModel: PlantViewModel())
    }
}



