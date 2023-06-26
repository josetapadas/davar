//
//  TaskListView.swift
//  Davar
//
//  Created by José Tapadas Alves on 16/06/2023.
//

import SwiftUI

struct TaskListView: View {
    @EnvironmentObject var taskListViewModel: TaskListViewModel
    
    var body: some View {
        List {
            ForEach(taskListViewModel.items) { item in
                TaskListRowView(item: item)
                    .frame(height: 52, alignment: Alignment.center)
                    .onTapGesture {
                        withAnimation(.linear) {
                            taskListViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: taskListViewModel.deleteItem)
            .onMove(perform: taskListViewModel.moveItem)
        }
        .listStyle(.plain)
        .navigationTitle("✏️ Tasks")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddTaskView())
        )
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TaskListView()
        }
        .environmentObject(TaskListViewModel())
    }
}
