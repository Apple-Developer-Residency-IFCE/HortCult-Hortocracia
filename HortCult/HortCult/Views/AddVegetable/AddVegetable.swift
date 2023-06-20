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
    @State private var addVegetableAlert = false
    @State private var discartVegetableAlert = false
    
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
                            NameDescription()
                            PickerCategoria()
                            PickerFrequencia()
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
        AddVegetable()
    }
}



