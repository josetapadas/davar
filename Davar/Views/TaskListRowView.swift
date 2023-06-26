//
//  TaskListRowView.swift
//  Davar
//
//  Created by José Tapadas Alves on 16/06/2023.
//

import SwiftUI

struct TaskListRowView: View {
    let item: TaskModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .black : .accentColor)
            Text(item.title)
                .foregroundColor(item.isCompleted ? .black : .accentColor)
            Spacer()
        }
    }
}

struct TaskListRowView_Previews: PreviewProvider {
    static var item1 = TaskModel(title: "sample task", isCompleted: false)
    static var item2 = TaskModel(title: "sample task second", isCompleted: true)
    
    static var previews: some View {
        Group {
            TaskListRowView(item: item1)
            TaskListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
