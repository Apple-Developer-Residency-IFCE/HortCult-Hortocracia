//
//  EditVegetable.swift
//  HortCult
//
//  Created by João Vitor Alves Holanda on 14/06/23.
//

import SwiftUI

struct EditVegetable: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var plantViewModel: PlantViewModel
    @State private var colorButton: String = "CinzaClaro"
    @AppStorage ("selectedTheme")private var selectedTheme: Choice?
    
    @State var plant: Plant
    @State  var name : String
    @State var description : String
    @State var categoria : String
    @State var frequencia : String
    var NavBar : some View {
        ZStack {
            Image(selectedTheme == .Escuro ? "Topbardark" : "Topbar")
            HStack {
                Button(action:{
                    self.presentationMode.wrappedValue.dismiss()
                } ) {
                    Image("Arrow-Left")
                }
                .padding(.leading, 18)
                Spacer()
            }
        }
        
    }
    
    var isFieldsFilled: Bool{
        return !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && categoria != "Selecionar..." && frequencia != "Selecionar..."
    }
    
    var body: some View {
        
        NavigationView {
            ZStack{
                ScrollView(.vertical){
                    ZStack{
                        VStack{
                            AddEditTitle(addEdit: false)
                            NameDescription(nameVegetable: $name, descriptionVegetable: $description)
                           PickerCategoria(selectedOption: $categoria)
                            PickerFrequencia(selectedOption: $frequencia)
                            AddEditPhotos()
                        }
                    }
                }
                .padding(.bottom, 100)
                
                Button(action: {
                    if isFieldsFilled{
                        self.presentationMode.wrappedValue.dismiss()
                        plantViewModel.updatePlant(plant: plant, name: name, information: description, category: categoria, frequency: frequencia, nextDate: plant.nextDate ?? Date() , image: plant.image ?? Data())
                    }
                    
                }) {
                    HStack {
                        Text("Salvar Alterações")
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
            
            
//
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavBar)
        
    }
    
}
struct EditVegetable_Previews: PreviewProvider {
    static var previews: some View {
        TesteEditar()
    }
}

struct TesteEditar: View {
    
  
    
    var body: some View {
        EditVegetable(plant: Plant(), name: "Tomatinho", description: "Tomate vermelho", categoria: select.temperos.rawValue, frequencia: options.dois.rawValue)
            .environmentObject(PlantViewModel())
    }
}
