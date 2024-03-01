//
//  ContentView.swift
//  Todo
//
//  Created by Caner Ağkaya on 1.03.2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var isShowing = false

    @Query(sort: \Todo.createdAt,order: .reverse) private var todos: [Todo]
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
