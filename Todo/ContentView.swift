//
//  ContentView.swift
//  Todo
//
//  Created by Caner Ağkaya on 1.03.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var isShowing = false

    @Query(sort: \Todo.createdAt,order: .reverse) private var todos: [Todo]
    private var sortedTodos: [Todo] {
        todos.sorted { !$0.isCompleted && $1.isCompleted }
    }

    
    var body: some View {
        NavigationStack {
            List {
                ForEach(sortedTodos) { todo in
                    Button {
                        todo.isCompleted.toggle()
                    } label: {
                        HStack {
                            Image(systemName: todo.isCompleted ? "checkmark.square" : "square")
                                
                            Text(todo.title)
                                .strikethrough(todo.isCompleted)
                                .animation(.bouncy)
                        }
                        .foregroundColor(todo.isCompleted ? .secondary : .primary)
                    }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        modelContext.delete(todos[index])
                    }
                })
            }
            .listStyle(.plain)
            .sheet(isPresented: $isShowing, content: {
                CreateTodoView()
            })
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
