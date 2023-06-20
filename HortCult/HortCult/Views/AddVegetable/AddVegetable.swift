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
    @State private var colorButton: String = "CinzaClaro"
    @State private var addVegetableAlert = false
    @State private var discartVegetableAlert = false
    
    @State private var name : String = ""
    @State private var description : String = ""
    @State private var categoria : String = "Selecionar..."
    @State private var frequencia : String = "Selecionar..."
    @State private var isFull: Bool = false
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
    
//    func confereView() {
//        if(name.count > 0 && description.count > 0 && (categoria == "Selecionar...") && frequencia !=  "Selecionar..." ){
//            isFull = true
//            colorButton = "VerdeEscuro"
//        }else{
//            colorButton = "CinzaClaro"
//            isFull = false
//        }
//    }
    
    var isFieldsFilled: Bool{
        return !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && categoria != "Selecionar..." && frequencia != "Selecionar..."
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
                
                Button(action: {
                    // Só um teste
                    colorButton = "VerdeEscuro"
                    addVegetableAlert = true
                    discartVegetableAlert = true
                    if isFieldsFilled{
                        self.presentationMode.wrappedValue.dismiss()
                        switch frequencia{
                            case options.diario.rawValue:
                                frequencia = "1"
                            case options.dois.rawValue:
                                frequencia = "2"
                            case options.quatro.rawValue:
                                frequencia = "4"
                            case options.semana.rawValue:
                                frequencia = "7"
                            default:
                                frequencia = " " // nao existe
                        }
                        plantViewModel.createPlant(name: name, information: description, category: categoria, frequency: frequencia, image: UIImage())
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
                .padding(.top, 602)
                .alert(isPresented: $addVegetableAlert) {
                    Alert(
                        title: Text("Planta cadastrada!"),
                        message: Text("Você pode ver sua planta diretamente na tela inicial, em \"Minha Horta\""),
                        primaryButton: .default(Text("Tela Inicial")),
                        secondaryButton: .default(
                            Text("Ver Planta")
                                .foregroundColor(Color("Cinza"))
                        )
                    )

                }
                //descartar a criacao da planta
                .alert(isPresented: $discartVegetableAlert) {
                    Alert(
                        title: Text("Deseja descartar a criação da sua planta?"),
                        message: Text("Essa ação não poderá ser desfeita."),
                        primaryButton: .cancel(Text("Cancelar")),
                        secondaryButton: .default(
                            Text("Descartar")
                        )
                    )

                }
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



