import SwiftUI

struct Home: View {
    @Environment(\.colorScheme) var colorScheme

    let platListViewModel: PlantListViewModel
    let coredataServices: CoredataServices
    let listReminderViewModel: ListReminderViewModel
    init(){
        self.coredataServices = CoredataServices()
        self.platListViewModel = PlantListViewModel(service: coredataServices)
        self.listReminderViewModel = ListReminderViewModel(service: coredataServices)
    }
    var body: some View {
        NavigationView {
            VStack{
                HeaderLogo()
                    .padding(.bottom, -10)
                    .ignoresSafeArea()
                
                ScrollView(.vertical){
                    ListaPlantasView()
                        .environmentObject(platListViewModel)
                        .padding(.top, 20)
                    CarrosselDeDicas()
                    ListReminderCardView()
                        .environmentObject(listReminderViewModel)
                        .padding(.bottom, 110)
                    
                }//.offset(y:-47)
                
            }.ignoresSafeArea()
            }.navigationBarBackButtonHidden(true)
    }
}


