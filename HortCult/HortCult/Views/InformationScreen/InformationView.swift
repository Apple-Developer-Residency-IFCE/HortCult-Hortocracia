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
    @EnvironmentObject var plantViewModel: PlantViewModel
    @AppStorage ("selectedTheme")private var selectedTheme: Choice?
    @State private var shouldNavigateButton = false
    
    
    //    @State var images: [UIImage]
    //    @State var description: String
    //    @State var img: String
    //    @State var data: String
    
    @State var planta: Plant
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
    
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical){
                ZStack{
                    VStack{
                        ImagesListView()
                            .padding(.bottom, 16)
                        
                        DescriptionPlant(planta: planta)
                            .padding(.bottom, 24)
                        
                        CardProxRegaView(dataProxRega: formatDate(date: planta.nextDate ?? Date()), plant: planta)
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
                        NavigationLink {
                            EditVegetable(plant: planta, name: planta.name ?? "", description: planta.information ?? "", categoria: planta.category ?? "", frequencia: planta.frequency ?? "")
                        } label: {
                            HStack {
                                Image(selectedTheme == .Escuro ? "EditarGreenDark" : "EditarGreen")
                                Text("Editar Informações")
                                    .font(.system(size: 16))
                                    .bold()
                            }
                            .foregroundColor(Color("VerdeEscuro"))
                            .padding()
                            .frame(width: 275, height: 42)
                            .background(Color("Branco"))
                            .cornerRadius(40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color("VerdeEscuro"), lineWidth: 2)
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
                                    shouldNavigateButton = true
                                    plantViewModel.deletePlant(plant: planta)
                                }
                                
                            ).padding(.top, 180)
                            
                        }.frame(width: 300, height: 100)
                        
                        
                    }
                    
                }
            }.ignoresSafeArea(.all)
            NavigationLink(destination: Home(), isActive: $shouldNavigateButton){
                EmptyView()
            }
            
        }.alert(isPresented: $deleteVegetableAlert) {
            Alert(
                title: Text("Deseja excluir essa planta?")
                    .foregroundColor(.red), // Alterando a cor do título para vermelho
                message: Text("Essa ação não poderá ser desfeita.")
                    .foregroundColor(.red), // Alterando a cor da mensagem para vermelho
                primaryButton: .cancel(Text("Cancelar")){},
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
