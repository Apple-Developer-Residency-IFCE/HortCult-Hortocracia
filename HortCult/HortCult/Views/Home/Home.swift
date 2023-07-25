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
            ScrollView(.vertical){
                HeaderLogo()
                    .ignoresSafeArea()
                ListaPlantasView()
                    .environmentObject(platListViewModel)
                    .padding(.top,20)
                ListReminderCardView()
                    .environmentObject(listReminderViewModel)
                CarrosselDeDicas()

            }
            .offset(y:-47)
        }.navigationBarBackButtonHidden(true)
    }
}


