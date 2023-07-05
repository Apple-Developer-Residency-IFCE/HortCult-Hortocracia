//
//  TabBarView.swift
//  HortCult
//
//  Created by Gabriel Carvalho on 29/06/23.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab = 0
    @ObservedObject var plantViewModel: PlantViewModel
    @AppStorage ("showOnboarding") var showOnboarding: Bool = true
    
    init(plantViewModel: PlantViewModel) {
        self.plantViewModel = plantViewModel
        plantViewModel.fetch()
    }
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            if showOnboarding {
                Onboarding(showOnboarding: $showOnboarding)
            } else {
                
                TabView(selection: $selectedTab) {
                    Home()
                        .tag(0)
                    Text("Futura tela de consulta")
                        .tag(1)
                    Text("Futura tela de controle climático")
                        .tag(2)
                    AjustesView()
                        .tag(3)
                }
                ZStack{
                    Rectangle()
                        .foregroundColor(Color("BrancoTabBar"))
                        .background(Color.clear)
                        .shadow(color: .black.opacity(0.1), radius: 5)
                    HStack{
                        ForEach((TabBarItems.allCases), id: \.self){ item in
                            Button {
                                selectedTab = item.rawValue
                            } label: {
                                CustomTabItem(imageName: item.iconName, isActive: (selectedTab == item.rawValue))
                            }
                        }
                    }
                }
                    .frame(height: 90)
            }
        }.environmentObject(plantViewModel)
            .edgesIgnoringSafeArea(.bottom)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(plantViewModel: PlantViewModel())
        
    }
}
