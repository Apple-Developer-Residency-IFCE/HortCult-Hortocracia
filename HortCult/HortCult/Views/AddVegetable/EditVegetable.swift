//
//  EditVegetable.swift
//  HortCult
//
//  Created by João Vitor Alves Holanda on 14/06/23.
//

import SwiftUI

struct EditVegetable: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var colorButton: String = "CinzaClaro"

    @State  var name : String
    @State var description : String
    @State var categoria : String
    @State var frequencia : String
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
                    // Só um teste
                    colorButton = "VerdeEscuro"
                    
                }) {
                    HStack {
                        Text("Salvar Alterações")
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

struct EditVegetable_Previews: PreviewProvider {
    static var previews: some View {
        TesteEditar()
    }
}

struct TesteEditar: View {
    
  
    
    var body: some View {
        EditVegetable(name: "Tomatinho", description: "Tomate vermelho", categoria: select.temperos.rawValue, frequencia: options.dois.rawValue)
        
    }
}
