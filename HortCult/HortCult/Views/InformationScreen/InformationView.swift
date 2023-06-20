//
//  InformationView.swift
//  HortCult
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct InformationView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var deleteVegetableAlert = false
    @State private var confirmDeleteVegetableAlert = false
    @State private var backHomeAlert = false

       // @ViewBuilder var content: () -> Content
        
        var NavBarInfo : some View {
            ZStack{
                HStack{
                    Button(action:{
                        self.presentationMode.wrappedValue.dismiss()
                    } ) {
                        Image("Arrow-Left-Light")
                        Text("Voltar").foregroundColor(.white)
                    }
                    .padding(.leading, 18)
                    Spacer()
                    
                }.allowsHitTesting(true)
            }
        }
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical){
                ZStack{
                    VStack{
                            ImagesListView()
                        .padding(.bottom, 16)
                        
                        DescriptionPlant()
                            .padding(.bottom, 24)
                        
                        CardProxRegaView(imagem: "Tomatinho", dataProxRega: "05/07")
                            .padding(.bottom, 24)
                        
                        HStack {
                            VStack(alignment: .leading){
                                Text("Frequência de Rega")
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                                    .padding(.leading, 20)
                                Text("Todos os Dias")
                                    .font(.system(size: 18))
                                    .foregroundColor(.black)
                                    .bold()
                                    .padding(.leading, 20)
                                    .padding(.top, 4)
                                
                            }
                            Spacer()
                        }
                        Button(action: {
                            
                        }) {
                            HStack {
                                Image("Editar")
                                Text("Editar Informações")
                                    .font(.system(size: 16))
                                    .bold()
                            }
                            .foregroundColor(Color("H1Color"))
                            .padding()
                            .frame(width: 275, height: 42)
                            .background(.white)
                            .cornerRadius(40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color("H1Color"), lineWidth: 2)
                            )
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 16)
                        
                        Button(action: {
                            deleteVegetableAlert = true
                        }) {
                            HStack {
                                Image("Remover")
                                Text("Excluir da minha horta")
                                    .font(.system(size: 16))
                                    .bold()
                            }
                            .foregroundColor(.white)

                            .frame(width: 275, height: 42)
                            .background(Color("Vermelho"))
                            .cornerRadius(40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color("Vermelho"), lineWidth: 2)
                            )
                        }.padding(.bottom, 50)

                    }
                    if confirmDeleteVegetableAlert {
                        VStack {
                            CustomAlert(
                                title: "Planta Excluida!",
                                message: "",
                                primaryButtonTitle: "Voltar para Tela Inicial",
                                primaryButtonAction: {
                                    backHomeAlert = true
                                }
                            ).padding(.top, 180)

                        }.frame(width: 300, height: 100)
                        NavigationLink(destination: Home(), isActive: $backHomeAlert){
                            EmptyView()
                        }

                    }

                }                
            }.ignoresSafeArea(.all)
            
        }.alert(isPresented: $deleteVegetableAlert) {
            Alert(
                title: Text("Deseja excluir essa planta? "),
                message: Text("Essa ação não poderá ser desfeita."),
                primaryButton: .cancel(Text(" Cancelar")){},
                secondaryButton:
                        .default(Text("Excluir")) {
                    deleteVegetableAlert = false
                    confirmDeleteVegetableAlert = true
                }
            )
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavBarInfo)
    }
    
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
