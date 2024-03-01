//
//  TodoApp.swift
//  Todo
//
//  Created by Caner Ağkaya on 1.03.2024.
//

import SwiftUI
import SwiftData

@main
struct TodoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Todo.self)
    }
}
