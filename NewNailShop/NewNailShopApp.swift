//
//  NewNailShopApp.swift
//  NewNailShop
//
//  Created by AD2201016P02 on 12/18/24.
//

import SwiftUI

@main
struct NewNailShopApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(tabIndex: .home)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
