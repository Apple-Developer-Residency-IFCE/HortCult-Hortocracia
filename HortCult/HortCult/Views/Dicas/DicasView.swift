//
//  DicasView.swift
//  HortCult
//
//  Created by Victor Viana on 17/07/23.
//

import SwiftUI


struct DicasView: View {
    var imagemDica: Image
    var tituloDica: String
    var textoDica: Image
    var fonteDica: String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    self.presentationMode.wrappedValue.dismiss()
                }label: {
                    Text("OK")
                        .font(Font.custom("Satoshi-Regular", size: 16))
                        .foregroundColor(Color("VerdeEscuro"))
                }
                Spacer()
                
                Text("Dicas")
                    .font(Font.custom("Satoshi-Regular", size: 16))
                    .foregroundColor(Color("Preto"))
                    .padding(.leading, -30)
                
                Spacer()
            }.padding(.top, 20)
                .padding(.leading, 10)
              
            ScrollView(.vertical){
                
                    imagemDica
                        .resizable()
                        .frame(width: 390, height: 207)
                VStack(alignment: .leading){
                    HStack{
                        Text(tituloDica)
                            .font(Font.custom("Satoshi-Medium", size: 24))
                            .foregroundColor(Color("VerdeEscuro"))
                            
                        Spacer()
                    }
                    
                    textoDica
                    
                    Link(destination: URL(string: "https://" + fonteDica)!) {
                        if let fonte = fonteDica.firstIndex(of: "/"){
                            Text("Fonte: " + fonteDica.prefix(upTo: fonte))
                                .font(Font.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color("VerdeEscuro"))
                                .underline(true, color: Color("VerdeEscuro"))
                                .padding(.top, 12)
                        }
                    }
                }.padding(.leading, 30)
            }
         
        }
    }
    
}

struct DicasView_Previews: PreviewProvider {
    static var previews: some View {
        DicasView(imagemDica: Image("DicaSaudavel"), tituloDica: "Sua horta é saudável?", textoDica: Image("TextoSaudavel"), fonteDica: "plastprime.com")
    }
}
