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
    
    let editPlant:EditPlantViewModel
    let cardProxRega:CardProxRegaViewModel
    let imageListViewModel:ImageListViewModel
    
    @EnvironmentObject var informationViewModel: InformationViewModel
    
    @AppStorage ("selectedTheme")private var selectedTheme: Choice?
    @State private var shouldNavigateButton = false
    @State var isOverlayShown = false
    
    @ViewBuilder var Name: some View {
        Text(informationViewModel.planta.name)
                .bold()
                .foregroundColor(Color("VerdeEscuro"))
                .font(.custom("Satoshi-Bold", size: 28))
    }
    @ViewBuilder var Categoria: some View {
        Text(informationViewModel.planta.category)
            .padding(.horizontal, 13)
            .padding(.vertical, 8)
            .foregroundColor(Color("Cinza"))
            .font(.custom("Satoshi-Regular", size: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color(.gray), lineWidth: 1)
            )
    }
    @ViewBuilder var Information: some View {
        Text(informationViewModel.planta.information)
            .font(.custom("Satoshi-Regular", size: 16))
            .lineLimit(5)
    }
    var NavBarInfo : some View {
        ZStack{
            HStack{
                Button(action:{
                    self.presentationMode.wrappedValue.dismiss()
                } ) {
                    Image("Arrow-Left-Light")
                    Text("Voltar")
                        .font(Font.custom("Satoshi-Regular", size: 16))
                        .foregroundColor(.white)
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
                    LazyVStack(){
                        ImagesListView(imagesData: informationViewModel.planta.image)
                            .environmentObject(imageListViewModel)
                            .frame(minWidth: 390, minHeight: 390)
                            .ignoresSafeArea()
                            .edgesIgnoringSafeArea(.all)
                            .padding(.bottom, 16)
                        VStack(alignment: .leading){
                            HStack{
                                //Text(String(togled))
                                Name
                                Spacer()
                                Categoria
                            }
                            .padding(.bottom,12)
                            Information
                                .padding(.bottom,18)
                        }
                        .padding(.horizontal,20)
                        
                        CardProxRegaView(dataProxRega: formatDate(date: informationViewModel.planta.nextDate))
                            .environmentObject(cardProxRega)
                            .padding(.bottom, 24)
                        
                        HStack {
                            VStack(alignment: .leading){
                                Text("Frequência de Rega")
                                    .font(Font.custom("Satoshi-Regular", size: 16))
                                Text(informationViewModel.planta.frequency)
                                    .font(Font.custom("Satoshi-Bold", size: 18))
                                    .bold()
                                
                            }
                            .foregroundColor(Color("TextOnInfo"))
                            Spacer()
                        }
                        .padding(.horizontal,20)
                        NavigationLink {
                            EditPlantView(){
                                informationViewModel.planta = informationViewModel.service.fetchPlantModel(by: informationViewModel.planta.id)
                                
                            }
                            .environmentObject(editPlant)
                        } label: {
                            HStack {
                                Image(selectedTheme == .Escuro ? "EditarGreenDark" : "EditarGreen")
                                Text("Editar Informações")
                                    .font(Font.custom("Satoshi-Regular", size: 16))
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
                                    .font(Font.custom("Satoshi-Regular", size: 16))
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
                    if deleteVegetableAlert {
                        VStack {
                            CustomAlert(
                                title: "Deseja excluir essa planta?",
                                message: "Essa ação não poderá ser desfeita.",
                                primaryButtonTitle: "Excluir",
                                primaryButtonAction: {
                                    confirmDeleteVegetableAlert = true
                                    deleteVegetableAlert = false
                                    
                                },
                                secondaryButtonTitle: "Cancelar",
                                secondaryButtonAction: {
                                    deleteVegetableAlert = false
                                    
                                }
                                
                                
                            ).padding(.top, 180)
                            
                        }.frame(width: 300, height: 100)
                            .zIndex(1)
                            .onAppear {
                                isOverlayShown = true
                            }
                    }
                    
                    if confirmDeleteVegetableAlert {
                        VStack {
                            CustomAlert(
                                title: "Planta Excluida!",
                                message: "",
                                primaryButtonTitle: "Voltar para a Tela Inicial",
                                primaryButtonAction: {
                                    shouldNavigateButton = true
                                    informationViewModel.deletePlant(plantModel: informationViewModel.planta)
                                }
                                
                                
                            ).padding(.top, 180)
                            
                        }.frame(width: 300, height: 100)
                            .zIndex(1)
                            .onAppear {
                                isOverlayShown = true
                            }
                        
                        
                    }
                    if isOverlayShown{
                        Color.black.opacity(0.1)
                            .edgesIgnoringSafeArea(.all)
                    }
                    
                }
                .navigationBarItems(leading: NavBarInfo)
                
            }.padding(.bottom, 60)
            .edgesIgnoringSafeArea(.all)
            
        }
        .navigationBarBackButtonHidden(true)
        //.navigationBarItems(leading: NavBarInfo)
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}
//struct InformationView_Previews: PreviewProvider {
//    static var previews: some View {
//        InformationView()
//    }
//}
