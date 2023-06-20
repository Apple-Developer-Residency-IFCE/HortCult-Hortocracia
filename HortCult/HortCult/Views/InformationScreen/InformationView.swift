//
//  InformationView.swift
//  HortCult
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct InformationView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
            
    @State var images: [UIImage]
    @State var description: String
    @State var img: String
    @State var data: String
    
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
    
                            
                            ImagesListView(userImages: $images)
                        .padding(.bottom, 16)
                        
                        DescriptionPlant(description: $description)
                            .padding(.bottom, 24)
                        
                        CardProxRegaView(imagem: $img, dataProxRega: $data)
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
                }
                
            }.ignoresSafeArea(.all)
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavBarInfo)
        
    }
    
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        TesteInfor()
    }
}

struct TesteInfor: View {
    @State var img: [UIImage] = [
                       UIImage(named: "Tomatinho")!,
                       UIImage(named: "Tomatinho")!,
                       UIImage(named: "Tomatinho")!
                       ]
    @State var desc: String = "O tomate é um fruto rico em vitamina C, vitamina A, vitamina K e licopeno, que é um potente antioxidante, ajudando a manter a saúde da pele, fortalecer o sistema imunológico e evitar doenças cardiovasculares, como infarto e aterosclerose."
    @State var img2: String = "Water"
    @State var rega: String = "20/06"
                       
    var body: some View {
        
        InformationView(images: img, description: desc, img: img2, data: rega)
    }
}

