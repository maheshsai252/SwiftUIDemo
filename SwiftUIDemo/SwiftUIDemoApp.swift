//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Mahesh sai on 06/08/21.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
