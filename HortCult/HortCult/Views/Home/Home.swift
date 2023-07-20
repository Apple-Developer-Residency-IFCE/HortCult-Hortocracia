import SwiftUI

struct Home: View {
    @Environment(\.colorScheme) var colorScheme
    let platListViewModel = PlantListViewModel(service: CoredataServices())
    
    var body: some View {
        NavigationView {
            VStack{
                HeaderLogo()
                    .ignoresSafeArea()
                ListaPlantasView()
                    .environmentObject(platListViewModel)
                    .padding(.top,20)
                ScrollViewWithHeader()
            }
            .offset(y:-47)
        }.navigationBarBackButtonHidden(true)
    }
}


