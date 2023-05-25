//
//  HortCultApp.swift
//  HortCult
//
//  Created by userext on 23/05/23.
//

import SwiftUI

@main
struct HortCultApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            Splash()
        }
    }
}
