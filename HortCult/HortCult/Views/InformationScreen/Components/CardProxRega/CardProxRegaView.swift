import SwiftUI

struct CardProxRegaView: View {
    var imagem: String = "WaterBlue"
    @State var dataProxRega: String
    @EnvironmentObject var cardProxRegaViewModel:CardProxRegaViewModel
    
    var body: some View {
        HStack(spacing: 16){
            Image(imagem)
                .frame(width: 52, height: 52)
                .background(Color("Azul").opacity(0.1))
                .cornerRadius(60)
                .padding(.leading, 20)
            
            VStack(alignment: .leading){
                
                Text("Próxima rega:")
                    .font(Font.custom("Satoshi-Regular", size: 16))
                    .foregroundColor(Color("CinzaEscuro"))
                
                Text(dataProxRega)
                    .font(Font.custom("Satoshi-Regular", size: 18))
                    .foregroundColor(Color("Preto"))
                
                Button{
                    cardProxRegaViewModel.updateDatePlant()
                    let formatter = DateFormatter()
                    formatter.dateFormat = "dd/MM/yyyy"
                    dataProxRega = formatter.string(from: cardProxRegaViewModel.nextDate)
                } label: {
                    Text("Marcar como regado")
                        .font(Font.custom("Satoshi-Regular", size: 12))
                        .foregroundColor(Color("Cinza"))
                }.frame(width: 131, height: 28)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color("Cinza"), lineWidth: 1)
                )

            }
            Spacer()
        }.frame(width: 350, height: 118)
            .background(Color("Azul").opacity(0.2))
            .cornerRadius(12)
            
    }
}
