//
//  h240910SwiftUIAppApp.swift
//  h240910SwiftUIApp
//
//  Created by hwacdx on 2024/9/10.
//  本 Demo 链接：https://developer.apple.com/tutorials/swiftui/creating-and-combining-views

import SwiftUI
import SwiftData

@main //应用程序的入口
struct h240910SwiftUIAppApp: App {
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

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
