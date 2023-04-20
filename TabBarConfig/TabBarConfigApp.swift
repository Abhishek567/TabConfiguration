//
//  TabBarConfigApp.swift
//  TabBarConfig
//
//  Created by Swaminarayan on 03/04/23.
//

import SwiftUI

@main
struct TabBarConfigApp: App {
    @StateObject var persistenceDB = PersistenceController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                              persistenceDB.container.viewContext)
//            HomeView()
        }
    }
}
