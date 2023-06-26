//
//  TaskModel.swift
//  Davar
//
//  Created by José Tapadas Alves on 18/06/2023.
//

import Foundation

struct TaskModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> TaskModel {
        return TaskModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
