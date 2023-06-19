//
//  AddVegetable.swift
//  HortCult
//
//  Created by João Vitor Alves Holanda on 06/06/23.
//

import SwiftUI

struct AddVegetable: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var colorButton: String = "CinzaClaro"
    @State private var name : String = " "
    @State private var description : String = " "
    @State private var categoria : String = "Selecionar..."
    @State private var frequencia : String = "Selecionar..."
    var NavBar : some View {
        ZStack {
            Image("Topbar")
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
                    
                }) {
                    HStack {
                        Text("Adicionar Novo Vegetal")
                            .font(.system(size: 16))
                            .bold()
                    }
                    .foregroundColor(.white)
                    
                    .frame(width: 350, height: 42)
                    .background(Color(colorButton))
                    .cornerRadius(40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color(colorButton), lineWidth: 2)
                    )
                }
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
        AddVegetable()
    }
}



