import SwiftUI

struct Home: View {
    @Environment(\.colorScheme) var colorScheme
//    let plantViewModel = PlantViewModel()
    let platListViewModel = PlantListViewModel(service: CoredataServices())
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical){
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


