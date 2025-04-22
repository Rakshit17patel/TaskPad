//
//  TaskPadApp.swift
//  TaskPad
//
//  Created by Rakshit Patel on 4/21/25.
//

import SwiftUI

@main
struct TaskPadApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
