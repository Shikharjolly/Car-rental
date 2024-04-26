/*
hbcarrental_4900projectApp.swift
hbcarrental.4900project
Created by Ayrat Aymetov 4/10/24.
*/

import SwiftUI
import SwiftData

@main
struct hbcarrental_4900projectApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    @StateObject var userAuth = UserAuth()

    var body: some Scene {
        WindowGroup {
            if userAuth.isLoggedin {
                ContentView()
            } else {
                SplashScreen()
            }
        }
        .environmentObject(userAuth)
        .modelContainer(sharedModelContainer)
    }
}