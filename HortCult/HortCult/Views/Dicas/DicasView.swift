//
//  DicasView.swift
//  HortCult
//
//  Created by Victor Viana on 17/07/23.
//

import SwiftUI

//struct DicasView: View {
//    @State private var showingSheet: Bool = false
//
//    var body: some View {
//        Button("Mostrar Sheet") {
//            showingSheet.toggle()
//        }
//        .sheet(isPresented: $showingSheet) {
//            SheetView(showingSheet: $showingSheet)
//        }
//    }
//}

struct SheetView: View {
    
    @Binding var showingSheet: Bool
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    showingSheet.toggle()
                }label: {
                    Text("OK")
                        .font(Font.custom("Satoshi-Regular", size: 16))
                        .foregroundColor(Color("VerdeEscuro"))
                }
                Spacer()
                
                Text("Dicas")
                    .font(Font.custom("Satoshi-Regular", size: 16))
                    .foregroundColor(Color("Preto"))
                    .padding(.leading, -20)
                
                Spacer()
            }.padding(.top, 20)
                .padding(.leading, 10)
            
            
            
            ScrollView(.vertical){
                Image("DicaSaudavel")
                    .resizable()
                    .frame(width: 390, height: 207)
                
                Text("Sua horta é saudável?")
                    .font(Font.custom("Satoshi-Medium", size: 24))
                    .foregroundColor(Color("Preto"))
           
                
                HStack{
                         
                    Text("Segundo o ")
                        .font(Font.custom("Satoshi-Regular", size: 16))
                        .foregroundColor(Color("Cinza"))
                    + Text("PlastPrime")
                        .font(Font.custom("Satoshi-Regular", size: 16))
                        .foregroundColor(Color("VerdeEscuro"))
                        .underline(true, color: Color("VerdeEscuro"))
                    
                    + Text(", um blog de cuidados com hortas, a importância de cuidar de uma horta de maneira integrada para obter resultados melhores. Aqui estão algumas ")
                        .font(Font.custom("Satoshi-Regular", size: 16))
                        .foregroundColor(Color("Cinza"))
                    + Text("dicas para manter uma horta saudável:")
                        .font(Font.custom("Satoshi-Regular", size: 16))
                        .foregroundColor(Color("VerdeClaro"))
                        .underline(true, color: Color("VerdeClaro"))
                }
                paragraphBody
//                HStack{
//                    Text("1. Conheça as variedades: ")
//                        .font(Font.custom("Satoshi-Bold", size: 16))
//                        .foregroundColor(Color("Cinza"))
//
//                    + Text("Antes de escolher as plantas para a sua horta, é importante conhecer suas necessidades e hábitos de crescimento, bem como a estação de plantio adequada. Isso ajudará você a cultivá-las da melhor maneira e escolher espécies que se adaptem ao seu espaço.")
//                        .font(Font.custom("Satoshi-Regular", size: 16))
//                        .foregroundColor(Color("Cinza"))
//                }
//                HStack{
//                    Text("2. Escolha o local ideal: ")
//                        .font(Font.custom("Satoshi-Bold", size: 16))
//                        .foregroundColor(Color("Cinza"))
//
//                    + Text("O local da horta influencia diretamente o desenvolvimento das plantas. Opte por áreas bem arejadas e com incidência de luz solar. Considere também as necessidades específicas de cada espécie.")
//                        .font(Font.custom("Satoshi-Regular", size: 16))
//                        .foregroundColor(Color("Cinza"))
//                }
//                HStack{
//                    Text("3. Regue com cuidado: ")
//                        .font(Font.custom("Satoshi-Bold", size: 16))
//                        .foregroundColor(Color("Cinza"))
//
//                    + Text("A rega adequada é essencial para o crescimento saudável das plantas. Evite tanto o excesso quanto a falta de água. A quantidade de água deve ser equilibrada.")
//                        .font(Font.custom("Satoshi-Regular", size: 16))
//                        .foregroundColor(Color("Cinza"))
//                }
//                HStack{
//                    Text("4. Adube corretamente: ")
//                        .font(Font.custom("Satoshi-Bold", size: 16))
//                        .foregroundColor(Color("Cinza"))
//                    + Text("A adubação regular é importante para o crescimento saudável das plantas. Prefira adubos naturais, como restos de alimentos, fezes de animais e outras plantas.")
//                        .font(Font.custom("Satoshi-Regular", size: 16))
//                        .foregroundColor(Color("Cinza"))
//                }
//                HStack{
//                    Text("5. Use bons fertilizantes: ")
//                        .font(Font.custom("Satoshi-Bold", size: 16))
//                        .foregroundColor(Color("Cinza"))
//                    + Text("Em alguns casos, a adubação não é suficiente e é necessário usar fertilizantes para estimular o crescimento das plantas. Opte por fertilizantes naturais, sem compostos químicos.")
//                        .font(Font.custom("Satoshi-Regular", size: 16))
//                        .foregroundColor(Color("Cinza"))
//                }
//                HStack{
//                    Text("6. Use as ferramentas certas: ")
//                        .font(Font.custom("Satoshi-Bold", size: 16))
//                        .foregroundColor(Color("Cinza"))
//                    + Text("Utilize as ferramentas adequadas para cuidar da sua horta, como tesouras, pás e alicates. Certifique-se de que elas sejam de qualidade e atendam às necessidades das plantas.")
//                        .font(Font.custom("Satoshi-Regular", size: 16))
//                        .foregroundColor(Color("Cinza"))
//                }
//                HStack{
//                    Text("7. Proteja sua horta de pragas: ")
//                        .font(Font.custom("Satoshi-Bold", size: 16))
//                        .foregroundColor(Color("Cinza"))
//                    + Text("As pragas são uma ameaça constante para as hortas. Utilize métodos de controle que não prejudiquem a saúde das plantas.")
//                        .font(Font.custom("Satoshi-Regular", size: 16))
//                        .foregroundColor(Color("Cinza"))
//                }
//                HStack{
//                    Text("8. Dedique tempo: ")
//                        .font(Font.custom("Satoshi-Bold", size: 16))
//                        .foregroundColor(Color("Cinza"))
//                    + Text("Cuidar de uma horta requer tempo e atenção. Reserve um tempo diário para as rotinas de manutenção. Além de útil, cuidar da horta pode ser relaxante e prazeroso.")
//                        .font(Font.custom("Satoshi-Regular", size: 16))
//                        .foregroundColor(Color("Cinza"))
//                }
                
                
               // HStack{
//                    Text("9. Não esqueça da poda: ")
//                        .font(Font.custom("Satoshi-Bold", size: 16))
//                        .foregroundColor(Color("Cinza"))
//                    + Text("A poda é importante para estimular o crescimento saudável das plantas. Remova folhas secas e pontas de galhos para manter as mudas bonitas e com frutos.")
//                        .font(Font.custom("Satoshi-Regular", size: 16))
//                        .foregroundColor(Color("Cinza"))
             //   }
//                HStack{
//                    Text("10. Replante regularmente: ")
//                        .font(Font.custom("Satoshi-Bold", size: 16))
//                        .foregroundColor(Color("Cinza"))
//                    + Text("As plantas da sua horta não durarão para sempre. Esteja preparado para replantar quando necessário, mantendo sua horta sempre renovada e abundante.")
//                        .font(Font.custom("Satoshi-Regular", size: 16))
//                        .foregroundColor(Color("Cinza"))
//                }
//                Text("Seguindo essas dicas, você poderá ter uma horta saudável, cheia de vida e produtiva.")
//                    .font(Font.custom("Satoshi-Regular", size: 16))
//                    .foregroundColor(Color("Cinza"))
//
//                Text("Fonte: plastprime.com")
//                    .font(Font.custom("Satoshi-Regular", size: 16))
//                    .foregroundColor(Color("VerdeClaro"))
//                    .underline(true, color: Color("VerdeClaro"))
                
                
            }
        }
    }
    
    @ViewBuilder var paragraphBody: some View {
        Paragraph(title: "1. Conheça as variedades: ", text: "Antes de escolher as plantas para a sua horta, é importante conhecer suas necessidades e hábitos de crescimento, bem como a estação de plantio adequada. Isso ajudará você a cultivá-las da melhor maneira e escolher espécies que se adaptem ao seu espaço.")
        Paragraph(title: "2. Escolha o local ideal: ", text: "O local da horta influencia diretamente o desenvolvimento das plantas. Opte por áreas bem arejadas e com incidência de luz solar. Considere também as necessidades específicas de cada espécie.")
        Paragraph(title: "3. Regue com cuidado: ", text: "A rega adequada é essencial para o crescimento saudável das plantas. Evite tanto o excesso quanto a falta de água. A quantidade de água deve ser equilibrada.")
        Paragraph(title: "4. Adube corretamente: ", text: "A adubação regular é importante para o crescimento saudável das plantas. Prefira adubos naturais, como restos de alimentos, fezes de animais e outras plantas.")
        Paragraph(title: "5. Use bons fertilizantes: ", text: "Em alguns casos, a adubação não é suficiente e é necessário usar fertilizantes para estimular o crescimento das plantas. Opte por fertilizantes naturais, sem compostos químicos.")
        Paragraph(title: "6. Use as ferramentas certas: ", text: "Utilize as ferramentas adequadas para cuidar da sua horta, como tesouras, pás e alicates. Certifique-se de que elas sejam de qualidade e atendam às necessidades das plantas.")
        Paragraph(title: "7. Proteja sua horta de pragas: ", text: "Utilize as ferramentas adequadas para cuidar da sua horta, como tesouras, pás e alicates. Certifique-se de que elas sejam de qualidade e atendam às necessidades das plantas.")
        Paragraph(title: "8. Dedique tempo: ", text: "Cuidar de uma horta requer tempo e atenção. Reserve um tempo diário para as rotinas de manutenção. Além de útil, cuidar da horta pode ser relaxante e prazeroso.")
        Paragraph(title: "9. Não esqueça da poda: ", text: "A poda é importante para estimular o crescimento saudável das plantas. Remova folhas secas e pontas de galhos para manter as mudas bonitas e com frutos.")
        Paragraph(title: "10. Replante regularmente: ", text: "As plantas da sua horta não durarão para sempre. Esteja preparado para replantar quando necessário, mantendo sua horta sempre renovada e abundante.")
        
        
    }
}

struct Paragraph: View {
    var title: String
    var text: String
    
    var body: some View {
        HStack{
            Text(title)
                .font(Font.custom("Satoshi-Bold", size: 16))
                .foregroundColor(Color("Cinza"))
            
            + Text(text)
                .font(Font.custom("Satoshi-Regular", size: 16))
                .foregroundColor(Color("Cinza"))
        }
    }
    
}

struct DicasView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView(showingSheet: .constant(true))
    }
}
