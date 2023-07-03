import SwiftUI

struct TesteScrowviewView: View {
    let iconNames = ["house", "star", "heart"] // Array com os nomes dos ícones do SF Symbols
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(iconNames, id: \.self) { iconName in
                    Image(systemName: iconName) // Criar uma view de ícone do SF Symbols para cada nome de ícone no array
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                }
            }
        }
    }
}

struct TesteScrowview_Previews: PreviewProvider {
    static var previews: some View {
        TesteScrowviewView()
    }
}
