//
//  Todo.swift
//  Todo
//
//  Created by Caner Ağkaya on 1.03.2024.
//

import Foundation
import SwiftData

@Model
class Todo: Identifiable {
    @Attribute(.unique) let id = UUID()
    var title: String
    var isCompleted: Bool = false
    var createdAt: Date = Date()
    
    init(title: String) {
        self.title = title
        self.isCompleted = false
        self.createdAt = Date()
    }
}
