//
//  CreateTodoView.swift
//  Todo
//
//  Created by Caner Ağkaya on 1.03.2024.
//

import SwiftUI
import SwiftData

struct CreateTodoView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var title = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Title")) {
                    TextField("Title", text: $title)
                        .sensoryFeedback(.selection, trigger: title)
                }
                Section {
                    Button {
                        let todo = Todo(title: title)
                        modelContext.insert(todo)
                        
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                }
            }
            .navigationTitle("Create Todo")
        }
    }
}

#Preview {
    CreateTodoView()
}
