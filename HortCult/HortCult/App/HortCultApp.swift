//
//  HortCultApp.swift
//  HortCult
//
//  Created by userext on 23/05/23.
//

import SwiftUI

@main
struct HortCultApp: App {
    //let persistenceController = PersistenceController.shared
    
    @AppStorage ("isFirstLogin") static var isFirstLogin: Bool = true
    
    
    
    var body: some Scene {
        WindowGroup {
                
                if HortCultApp.isFirstLogin == true {
                    Splash()
                } else {
                    TabBarView(plantViewModel: PlantViewModel())
                }
        }
    }
}
